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
export default class Page2 extends Component<Props> {
  static navigationOptions = ({navigation}) => ({
    title: ` ${navigation.state.params.name}`,       //前一个页面传来的对象的name属性
  })
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>欢迎来到page2</Text>
        <Button title="go to homepage" onPress={() => this.props.navigation.goBack()} />
        <Button title="改变主题" onPress={() => this.props.navigation.setParams({theme:{
          tintColor:'red',
          updateTime: new Date().getTime()
        }})} />
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
