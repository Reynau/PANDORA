######################################################################
# Automatically generated by qmake (2.01a) dl. de mar 14 10:18:26 2011
######################################################################


TEMPLATE = app
TARGET =
FORMS += uis/AgentConfigurator.ui
FORMS += uis/Settings.ui
FORMS += uis/RasterConfigurator.ui
FORMS += uis/ColorInterval.ui
FORMS += uis/LoadingProgressBar.ui
FORMS += uis/Laboratory.ui
FORMS += uis/RunProcess.ui
FORMS += uis/AgentAnalysis.ui
FORMS += uis/RasterAnalysis.ui
FORMS += uis/TraitAnalysisSelection.ui
FORMS += uis/RasterAnalysisSelection.ui
FORMS += uis/HeatMapDialog.ui
FORMS += uis/TimeSeriesDialog.ui

DEFINES += TIXML_USE_STL
DEPENDPATH += .
INCLUDEPATH += .
INCLUDEPATH += uis/
INCLUDEPATH += $(PANDORAPATH)/include
INCLUDEPATH += $(PANDORAPATH)/include/analysis
INCLUDEPATH += /usr/include/qwt/
INCLUDEPATH += /usr/include/mpich2/ 
INCLUDEPATH += /usr/include/mpich/ 
INCLUDEPATH += /usr/include/GL/
INCLUDEPATH += /usr/include/qt4/QtOpenGL/
INCLUDEPATH += /usr/include/qt4/
INCLUDEPATH += /usr/include/IL/
INCLUDEPATH += /usr/local/hdf5/include/
INCLUDEPATH += /usr/local/qwt-6.0.0/include/
CONFIG += qt
QMAKE_CXXFLAGS += -std=c++11
QMAKE_LIBDIR += ../lib
QMAKE_LIBS += -lpandora

# Required when installing qwt-6.0.0 from sources
LIBS += -fopenmp -Llib/ -L/usr/local/qwt-6.0.0/lib/ -L/usr/local/hdf5/lib/ -lqwt -lhdf5 -lmpich -lmpi -lGL -lGLU -lQtOpenGL -lIL -ltinyxml -lboost_filesystem -lboost_system 

# Input
HEADERS += Display2D.hxx MainWindow.hxx AgentTypeSelection.hxx AgentTraitSelection.hxx DataPlot.hxx GenericStatistics.hxx StepDataPlot.hxx RasterSelection.hxx Display3D.hxx AgentConfigurator.hxx Model3D.hxx Object3D.hxx Material.hxx Loader3DS.hxx ColorSelector.hxx DefaultColorSelector.hxx AgentConfiguration.hxx RasterConfigurator.hxx ColorInterval.hxx RasterConfiguration.cxx ProjectConfiguration.hxx LoadSimulationThread.hxx LoadingProgressBar.hxx QuadTree.hxx Settings.hxx Laboratory.hxx RunSimulations.hxx SimulationControlThread.hxx AgentAnalysis.hxx RasterAnalysis.hxx TraitAnalysisSelection.hxx RasterAnalysisSelection.hxx AnalysisControlThread.hxx RunAnalysis.hxx HeatMapView.hxx HeatMapDialog.hxx HeatMapModel.hxx TimeSeriesDialog.hxx TimeSeriesModel.hxx TimeSeriesView.hxx
SOURCES += main.cxx Display2D.cxx  MainWindow.cxx AgentTypeSelection.cxx AgentTraitSelection.cxx DataPlot.cxx MeanDataPlot.cxx SumDataPlot.cxx  GenericStatistics.cxx StepDataPlot.cxx RasterSelection.cxx Display3D.cxx AgentConfigurator.cxx Model3D.cxx Object3D.cxx Material.cxx Loader3DS.cxx DefaultColorSelector.cxx AgentConfiguration.cxx RasterConfigurator.cxx ColorInterval.cxx RasterConfiguration.cxx ProjectConfiguration.cxx LoadSimulationThread.cxx LoadingProgressBar.cxx MpiStubCode.cxx QuadTree.cxx Settings.cxx Laboratory.cxx RunSimulations.cxx SimulationControlThread.cxx AgentAnalysis.cxx RasterAnalysis.cxx RasterAnalysis.hxx TraitAnalysisSelection.cxx RasterAnalysisSelection.cxx AnalysisControlThread.cxx RunAnalysis.cxx HeatMapView.cxx HeatMapDialog.cxx HeatMapModel.cxx TimeSeriesDialog.cxx TimeSeriesModel.cxx TimeSeriesView.cxx

DESTDIR = ../bin
RESOURCES = cassandra.qrc

