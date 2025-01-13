import FontAwesome from '@expo/vector-icons/FontAwesome';
import { Tabs } from 'expo-router';
import Ionicons from '@expo/vector-icons/Ionicons';

export default function TabLayout() {
  return (
    <Tabs screenOptions={{ tabBarActiveTintColor: 'blue' }}>
      <Tabs.Screen
        name="index"
        options={{
          title: 'Inicio',headerTitleAlign:'center',
          tabBarIcon: ({ color }) => <FontAwesome size={28} name="home" color={color} />,
        }}
      />
      <Tabs.Screen
        name="Posts"
        options={{
          title: 'Noticias',headerTitleAlign:'center',
          tabBarIcon: ({ color }) => <Ionicons name="newspaper-outline" size={28} color={color} />,
        }}
      />
      <Tabs.Screen
        name="radio"
        options={{
          title: 'Radio',headerTitleAlign:'center',
          tabBarIcon: ({ color }) => <Ionicons name="radio" size={28} color={color} />
        }}
      />
    </Tabs>
  );
}
