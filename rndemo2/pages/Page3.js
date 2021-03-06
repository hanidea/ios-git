/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, Button, TextInput} from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation'
type Props = {};
export default class Page3 extends Component<Props> {
  render() {
    const navigation = this.props.navigation;
    const {state,setParams} = navigation;
    const {params} = state;
    const showText = params.mode ==='edit' ? '正在编辑' : '编辑完成';
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>欢迎来到page3</Text>
        <Button title="go to homepage" onPress={() => navigation.goBack()} />
        {/* <Text>{showText}</Text> */}
        <TextInput
        style={styles.input}
        onChangeText={text=>{
          setParams({title:text})
        }}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  input:{
    height:50,
    borderWidth:1,
    marginTop:20,
    borderColor:'black',
    width:360
  },
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
