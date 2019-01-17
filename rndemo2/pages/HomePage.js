/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, Button} from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation'
type Props = {};
export default class HomePage extends Component<Props> {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>欢迎来到homepage</Text>
        <Button title="go to page1" onPress={() => this.props.navigation.navigate('Page1',{name:'动态的page1'})} />
        <Button title="go to page2" onPress={() => this.props.navigation.navigate('Page2',{name:'动态的page2'})} />
        <Button title="go to page3" onPress={() => this.props.navigation.navigate('Page3',{title:'James'})} />
        <Button title="go to TabNavigator" onPress={() => this.props.navigation.navigate('TabNav',{title:'James'})} />
        <Button title="go to DrawerNav" onPress={() => this.props.navigation.navigate('DrawerNav',{title:'James'})} />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
