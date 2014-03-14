
/*
 * Copyright (c) 2012
 * COMPUTER APPLICATIONS IN SCIENCE & ENGINEERING
 * BARCELONA SUPERCOMPUTING CENTRE - CENTRO NACIONAL DE SUPERCOMPUTACIÓN
 * http://www.bsc.es

 * This file is part of Pandora Library. This library is free software; 
 * you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation;
 * either version 3.0 of the License, or (at your option) any later version.
 * 
 * Pandora is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public 
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 * 
 */

#ifndef __Serializer_hxx__
#define __Serializer_hxx__

#include <hdf5.h>
#include <string>
#include <map>
#include <vector>
#include <mpi.h>
#include <Rectangle.hxx>
#include <typedefs.hxx>

namespace Engine
{

class Simulation;
class Agent;
class StaticRaster;
class Raster;
class World;
class SpacePartition;

class Serializer
{
	typedef std::map< std::string, Raster> RastersMap;
	typedef std::map< std::string, StaticRaster *> StaticRastersRefMap;

	typedef std::map< std::string, std::vector<int> * > IntMap;
	typedef std::map< std::string, std::vector<std::string> * > StringMap;
	typedef std::map< std::string, IntMap * > IntAttributesMap;
	typedef std::map< std::string, StringMap * > StringAttributesMap;

	int _id;
	int _numTasks;
	int _overlap;
	Rectangle<int> _boundaries;
	Rectangle<int> _ownedArea;
	int _numSteps;
	int _serializerResolution;

	std::string _resultsFile;

	StaticRastersRefMap _dynamicRasters;

	hid_t _agentsFileId;
	hid_t _fileId;
	// this id is used to track the data set of the agent being serialized
	hid_t _currentAgentDatasetId;

	void serializeRaster( const StaticRaster & raster, const std::string & datasetKey );

	// register the type of agent into the data structures _agentIndexsMap, _stringAttributes and _intAttributes and create HDF5 structures
	void registerType( Agent * agent);
	IntAttributesMap _intAttributes;
	StringAttributesMap _stringAttributes;

	std::map<std::string, int> _agentIndexMap;
	
	void executeAgentSerialization( const std::string & type, int step);
	void resetCurrentIndexs();

	int getDataSize( const std::string & type );

	void serializeAgent( Agent * agent, const int & step, int index);
	void finishAgentsSerialization( int step);

public:
	Serializer();
	virtual ~Serializer();

	void init( Simulation & simulation, std::vector<StaticRaster * > rasters, std::vector<bool> & dynamicRasters, std::vector<bool> serializeRasters, World & world, SpacePartition & scheduler );
	void finish();

	void serializeAttribute( const std::string & name, const int & value );

	
	void addStringAttribute( const std::string & type, const std::string & key, const std::string & value );
	void addIntAttribute( const std::string & type, const std::string & key, int value );

	void setResultsFile( const std::string & resultsFile ) { _resultsFile = resultsFile; }

	void serializeAgents( const int & step, const AgentsList::const_iterator beginAgents, const AgentsList::const_iterator endAgents);
	void serializeRasters(int step);
	void serializeStaticRasters( const StaticRastersRefMap & staticRasters);

};

} // namespace Engine

#endif // __Serializer_hxx__

