'use strict'

BaseModuleDataService = require 'scripts/BaseClasses/BaseModuleDataService.coffee'

module.exports = class StatsAlgorithms extends BaseModuleDataService
  @inject 'app_analysis_stats_msgService',
    '$interval'

  initialize: ->
    @msgManager = @app_analysis_stats_msgService
    @algorithms = []

  ############

  getNames: -> @algorithms.map (alg) -> alg.getName()

  getParamsByName: (algName) -> 
    (alg.getParams() for alg in @algorithms when algName is alg.getName()).shift()

  getChartData: (algName) ->
    (alg.getChartData() for alg in @algorithms when algName is alg.getName()).shift()

  setParamsByName: (algName, dataIn) ->
    (alg.setParams(dataIn) for alg in @algorithms when algName is alg.getName()).shift()

  passDataByName: (algName, dataIn) ->
    (alg.saveData(dataIn) for alg in @algorithms when algName is alg.getName()).shift()

  passAlphaByName: (algName, alphaIn) ->
    (alg.setAlpha(alphaIn) for alg in @algorithms when algName is alg.getName()).shift()

  resetByName: (algName) ->
    (alg.reset() for alg in @algorithms when algName is alg.getName()).shift()
