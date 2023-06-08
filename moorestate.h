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

#ifndef __MOORESTATE_H
#define __MOORESTATE_H


#include "atomic.h"     // class Atomic

class MooreState : public Atomic
{
public:
	MooreState( const string &name = "MooreState" );					//Default constructor
	~MooreState();
	virtual string className() const ;
protected:
	Model &initFunction();
	Model &externalFunction( const ExternalMessage & );
	Model &internalFunction( const InternalMessage & );
	Model &outputFunction( const InternalMessage & );

private:
	const Port &transitionIn, &eventIn;
	Port &stateOut, &transitionOut, &errorOut;
	
	int stateCode;
	int stateValue;
	bool hasStateValue;
	
	int *events;
	//int nextStates[];
	int numOfTransitions;
	int tempEvent;
	int tempNextState;
		
	bool isEvent;
	
	bool error;
	int errorCode;

};	// class MooreState

// ** inline ** // 
inline
string MooreState::className() const
{
	return "MooreState" ;
}

#endif   //__MOORESTATE_H
