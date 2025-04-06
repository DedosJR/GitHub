import React, { useState, useEffect } from 'react';
import { View, StyleSheet, Text } from 'react-native';
import { Audio } from 'expo-av';
import { LinearGradient } from 'expo-linear-gradient';
import RadioPlayer from '../components/RadioPlayer';
import NewsList from '../components/NewsList';
import ContactSection from '../components/ContactSection';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { MaterialIcons } from '@expo/vector-icons';

const Tab = createBottomTabNavigator();

const HomeTab = () => {
  return (
    <LinearGradient
      colors={['#1e3c72', '#2a5298']}
      style={styles.container}
    >
      <RadioPlayer streamUrl="https://server1.maxiradiofm.com:8000/radio.mp3" />
    </LinearGradient>
  );
};

const HomeScreen = () => {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        tabBarIcon: ({ focused, color, size }) => {
          let iconName;
          if (route.name === 'Radio') {
            iconName = 'radio';
          } else if (route.name === 'Noticias') {
            iconName = 'article';
          } else if (route.name === 'Contacto') {
            iconName = 'contact-page';
          }
          return <MaterialIcons name={iconName} size={size} color={color} />;
        },
        tabBarActiveTintColor: '#1e3c72',
        tabBarInactiveTintColor: 'gray',
      })}
    >
      <Tab.Screen name="Radio" component={HomeTab} />
      <Tab.Screen name="Noticias" component={NewsList} />
      <Tab.Screen name="Contacto" component={ContactSection} />
    </Tab.Navigator>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default HomeScreen;