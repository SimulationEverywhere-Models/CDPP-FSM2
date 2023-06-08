/*******************************************************************
*
*  DESCRIPTION: Atomic Model MooreState
*
*  AUTHOR: Tao Zheng 
*
*  EMAIL: zhengtao@sce.carleton.ca
*
*  DATE: 26/11/2002
*
*******************************************************************/

/** include files **/
#include "moorestate.h"      // class MooreState
#include "message.h"    // class ExternalMessage, InternalMessage
#include "mainsimu.h"   // MainSimulator::Instance().getParameter( ... )
#include "strutil.h"       // str2Int( ... )


/** public functions **/

/*******************************************************************
* Function Name: MooreState
* Description: 
********************************************************************/
MooreState::MooreState( const string &name )
: Atomic( name )
, transitionIn( addInputPort( "transitionIn" ) )
, eventIn( addInputPort( "eventIn" ) )
, stateOut( addOutputPort( "stateOut" ) )
, transitionOut( addOutputPort( "transitionOut" ) )
, errorOut( addOutputPort( "errorOut" ) )
{	isEvent = false;
	error = false;
	errorCode = 0;
		
	string code(MainSimulator::Instance().getParameter( description(), "StateCode" ) );
	stateCode = str2Int(code);
	
	string value(MainSimulator::Instance().getParameter( description(), "StateValue" ) );
	if (value != "" )
	{	stateValue = str2Int(value);
		hasStateValue = true;
	}
	else
	{	stateValue = stateCode;
		hasStateValue = false;
	}
	
	string num(MainSimulator::Instance().getParameter( description(), "NumberOfTransitions" ) );
	if (num != "" )
		numOfTransitions = str2Int(num);
	else
		numOfTransitions = 1;

	events = new int[numOfTransitions];
	/*
	for (int i = 1; i <= numOfTransitions; i++)
	{	events[i-1] = -1000;
	}
	*/
	
	for (int i = 1; i <= numOfTransitions; i++)
   {	string tempstr = string("Transition") + i;
   	string temptransition(MainSimulator::Instance().getParameter( description(), tempstr.c_str() ) );
   	string transition = temptransition;
		
		string::size_type pos = transition.find ("->",0);
   	if (pos == string::npos)
   	{	error = true;
   		errorCode = -998;
   	}
   	else
   	{	int index = pos;
   		string eventstr (transition,0,index);
   		int eventCode  = str2Int(eventstr);
   		string::size_type translen = transition.length();
   		int index2 = translen;
   		string nextstatestr(transition, index+2, index2-2);
   		int nextStateCode = str2Int(nextstatestr);
   		events[i-1] = eventCode * 100 + nextStateCode;

   	}

	}

   
	
}

/*******************************************************************
* Function Name: initFunction
* Description: Resetea la lista
* Precondition: El tiempo del proximo evento interno es Infinito
********************************************************************/
Model &MooreState::initFunction()
{	if (stateCode == 0)
	{	holdIn(active, Time::Inf);
	}
	else
	{	this-> passivate();
	}
	return *this ;
}

/*******************************************************************
* Function Name: externalFunction
* Description: 
********************************************************************/
Model &MooreState::externalFunction( const ExternalMessage &msg )
{	error = false;
   if( state() == active)
	{	if (msg.port() == eventIn )
		{  
      	tempEvent = static_cast <int> (msg.value());
			bool done = false;
         
			for (int i = 1; i <=numOfTransitions && !done; i++)
			{	
				int transCode = events[i-1];
				
				if ( tempEvent == transCode/100 )
				{  
					done = true;
					tempNextState = transCode % 100;
				}
			}
         
			if (!done)

			{	error = true;
				errorCode = -999;
         	//printf("unspecified reception.");
			}
			
			isEvent = true;
			holdIn(active, Time::Zero);
      }
		
	}
	else
	{	
		if (msg.port() == transitionIn)
		{ 	tempEvent = static_cast <int> (msg.value());
			if (tempEvent == stateCode)
			{	isEvent = false;
				holdIn(passive, Time::Zero);
			}
		}
	}
   return *this;
}

/*******************************************************************
* Function Name: internalFunction
* Description: 
********************************************************************/
Model &MooreState::internalFunction( const InternalMessage & )
{	if (!error)
	{	if (isEvent)
			passivate();
	
		else
			holdIn(active, Time::Inf);
	}
	else
	{	if (state() == passive)
			passivate();
		else
			holdIn(active, Time::Inf);	
	}		
	return *this ;
}

/*******************************************************************
* Function Name: outputFunction
* Description: 
********************************************************************/
Model &MooreState::outputFunction( const InternalMessage &msg )
{	
	if (error)
	{	sendOutput( msg.time(), errorOut, errorCode ) ;
	}
	else
	
	{	if (isEvent)
			sendOutput(msg.time(), transitionOut, tempNextState);
		else
		{	if (hasStateValue)
				sendOutput( msg.time(), stateOut, stateValue ) ;
		}
	}
			
	return *this ;
}

MooreState::~MooreState()
{
	delete []events;
}