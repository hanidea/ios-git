// import {AppStackNavigator} from './navigators/AppNavigators'

// export default AppStackNavigator;

import React, { Component } from 'react'
import { Platform, StyleSheet, Text, View } from 'react-native'
import { createStackNavigator, createAppContainer } from 'react-navigation'
import HomePage from './pages/HomePage'


const AppNavigator = createStackNavigator({
  Home: { screen: HomePage }
})

export default createAppContainer(AppNavigator);

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