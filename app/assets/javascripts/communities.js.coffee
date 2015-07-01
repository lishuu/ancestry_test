# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

zTreeOnClick = (event, treeId, treeNode) -> 
  getCommunities treeNode

setting = callback: onClick: zTreeOnClick

getDistrictTree = ->
  $.ajax
    url: '../tree_full.json'
    type: 'get'
    datatype: 'json'
    timeout: 1000
    error: ->
      alert '网络延时，请重试。'
    success: (res) ->
      treeNodes = res
      $.fn.zTree.init $('#districtTree'), setting, treeNodes

$ ->
  getDistrictTree()