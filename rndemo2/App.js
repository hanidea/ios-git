// import {AppStackNavigator} from './navigators/AppNavigators'

// export default AppStackNavigator;

import React, { Component } from 'react'
import { Platform, StyleSheet, Text, View ,Button,ScrollView} from 'react-native'
import { createStackNavigator, createAppContainer, createDrawerNavigator,DrawerItems, SafeAreaView} from 'react-navigation'
import { createBottomTabNavigator, BottomTabBar } from 'react-navigation-tabs';
import HomePage from './pages/HomePage'
import Page1 from './pages/Page1'
import Page2 from './pages/Page2'
import Page3 from './pages/Page3'
import Page4 from './pages/Page4'
import Page5 from './pages/Page5'
import Ionicons from 'react-native-vector-icons/Ionicons'
import MaterialIcons from 'react-native-vector-icons/MaterialIcons'
// class TabBarComponent extends React.Component{
//   constructor(props){
//     super(props);
//     this.theme={
//       tintColor: props.activeTintColor,
//       updateTime: new Date().getTime()
//     };
//   }
//   render(){
//     const {routes,index}=this.props.navigationState;
//     const {theme}=routes[index].params;
//     if(theme&&theme.updateTime>this.theme.updateTime){
//       this.theme=theme;
//     }
//     return <BottomTabBar {...this.props} activeTintColor={this.theme.tintColor||this.props.activeTintColor}
//     />
//   }
// }
const DrawerNav= createDrawerNavigator({
   Page4:{
     screen:Page4,
     navigationOptions:{
       drawerLabel:'Page4',
       drawerIcon:({tintColor})=>(
          <MaterialIcons 
          name={"drafts"}
          size={24}
          style={{color:tintColor}}/>
       )
     }
   },
   Page5:{
    screen:Page5,
    navigationOptions:{
      drawerLabel:'Page5',
      drawerIcon:({tintColor})=>(
         <MaterialIcons 
         name={"drafts"}
         size={24}
         style={{color:tintColor}}/>
      )
    }
  }
},{
  initialRouteName:'Page5',
  contentOptions:{
    activeTintColor:'#e89'
  },
  contentComponent: (props) => (
    <ScrollView style={{backgroundColor:'#ccf',flex:1}} >
      <SafeAreaView forceInset={{top:'always',horizontal:'never'}}>
        <DrawerItems {...props} />
      </SafeAreaView>
    </ScrollView>
  )
});
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
},{
  // tabBarComponent:TabBarComponent
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
  },
  DrawerNav:{
    screen:DrawerNav,
    navigationOptions:{
      title: 'This is DrawerNav'
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