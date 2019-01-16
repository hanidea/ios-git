// import {AppStackNavigator} from './navigators/AppNavigators'

// export default AppStackNavigator;

import React, { Component } from 'react'
import { Platform, StyleSheet, Text, View ,Button} from 'react-native'
import { createStackNavigator, createAppContainer,  createBottomTabNavigator} from 'react-navigation'
import HomePage from './pages/HomePage'
import Page1 from './pages/Page1'
import Page2 from './pages/Page2'
import Page3 from './pages/Page3'
import Ionicons from 'react-native-vector-icons/Ionicons'
const AppTabNavigator = createBottomTabNavigator({
    Page1:{
      screen:Page1,
      navigationOptions:{
        tabBarLabel:'Page1',
        tabBarIcon: ({tintColor, focused}) => (
          <Ionicons
              name={'ios-home'}
              size={26}
              style={{color: tintColor}}
          />
        ),
      }
    },
    Page2:{
      screen:Page2,
      navigationOptions:{
        tabBarLabel:'Page2',
        tabBarIcon:({tintColor,focused})=>(
            <Ionicons
                name={'ios-people'}
                size={26}
                style={{color: tintColor}}
            />
        ),
      }
    },
    Page3:{
      screen:Page3,
      navigationOptions:{
        tabBarLabel:'Page3',
        tabBarIcon:({tintColor,focused})=>(
            <Ionicons
                name={'ios-chatboxes'}
                size={26}
                style={{color: tintColor}}
            />
        ),
      }
    }
});
const AppNavigator = createStackNavigator({
  HomePage: { screen: HomePage,
    navigationOptions:{
    title: 'Home',
    headerBackTitle:'返回'
  }},
  Page1: { screen: Page1},
  Page2: { screen: Page2},
  Page3: { screen: Page3,
    navigationOptions:(props) => {
      const {navigation}=props;
      const {state,setParams}=navigation;
      const {params} = state;
      return {
        title:params.title?params.title:'this is page3',
        headerRight:(
          <Button
          title={params.mode==='edit'?'保存':'编辑'}
          onPress={()=>{
            setParams({mode:params.mode==='edit'?"":"edit"})
          }}
          />
        )
      }
    }
  },
  TabNav:{
    screen:AppTabNavigator,
    navigationOptions:{
      title: 'This is TabNavigator'
    }
  }
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