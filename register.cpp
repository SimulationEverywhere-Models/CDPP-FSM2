/*******************************************************************
*
*  DESCRIPTION: Simulator::registerNewAtomics()
*
*  AUTHOR: Tao Zheng
*
*  STUDENT#: 258050
*
*  EMAIL: zhengtao@sce.carleton.ca
*
*  DATE: 26/11/2002
*
*******************************************************************/

#include "modeladm.h" 
#include "mainsimu.h"
#include "mooreState.h"        // class MooreState


void MainSimulator::registerNewAtomics()
{
 	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<MooreState>(), "MooreState" ) ;   
} 

