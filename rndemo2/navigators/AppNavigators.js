import {StackNavigator} from 'react-navigation'
import HomePage from '../pages/HomePage'
export const AppStackNavigator = StackNavigator({
    HomePage: {
        screen: HomePage
    }
})