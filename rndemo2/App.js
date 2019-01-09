// import {AppStackNavigator} from './navigators/AppNavigators'

// export default AppStackNavigator;

import React, { Component } from 'react'
import { Platform, StyleSheet, Text, View } from 'react-native'
import { createStackNavigator, createAppContainer } from 'react-navigation'
import HomePage from './pages/HomePage'
import Page1 from './pages/Page1'

const AppNavigator = createStackNavigator({
  HomePage: { screen: HomePage, 
    navigationOptions:{
    header: null
 }},
  Page1: { screen: Page1, 
    navigationOptions:{
    header: null
 } },
})

export default createAppContainer(AppNavigator)

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5
  }
})