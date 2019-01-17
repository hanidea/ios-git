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
export default class Page4 extends Component<Props> {
  // static navigationOptions={
  //   title: 'Page1'
  // }
  static navigationOptions = ({navigation}) => ({
    title: ` ${navigation.state.params.name}`,       //前一个页面传来的对象的name属性
  })
  render() {
    return (
      <View style={{flex:1,backgroundColor:'gray'}}>
        <Text style={styles.welcome}>欢迎来到page4</Text>

        <Button title="Toggle Drawer" onPress={() => this.props.navigation.navigate('DrawerToggle')} />
        <Button title="Open Drawer" onPress={() => this.props.navigation.navigate('DrawerOpen')} />
        <Button title="Go to Page5" onPress={() => this.props.navigation.navigate('Page5')} />
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
