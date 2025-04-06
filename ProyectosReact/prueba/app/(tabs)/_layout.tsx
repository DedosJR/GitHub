import FontAwesome from "@expo/vector-icons/FontAwesome";
import { Tabs } from "expo-router";
import Ionicons from "@expo/vector-icons/Ionicons";
import Tab from ".";
import { Image } from "react-native";

export default function TabLayout() {
  return (
    <Tabs screenOptions={{ tabBarActiveTintColor: "#00c846",
     tabBarStyle:{ backgroundColor:'#f2f3f4', paddingBottom:0,paddingTop:0,bottom:0},
     headerStyle:{backgroundColor:'#ffcc00'},
     headerTitleStyle:{fontWeight:'500', color:'#000',fontSize:22, marginLeft:10},
     /*headerRight: () => (
      <Image
        source={require('../../assets/icon-96x96.png')}
        style={{ width: 50, height: 50, marginRight: 180 }}
      />
    ),
    */
     }}>
      <Tabs.Screen
        name="index"
        options={{
          title: "Home",
          headerTitleAlign: "center", 
          tabBarIcon: ({color}) => (
            <FontAwesome size={28} name="home" color={color} />
          ),
        }}
        
      />
      <Tabs.Screen
        name="Posts"
        options={{
          title: "Noticias",
          headerTitleAlign: "center",
          tabBarIcon: ({ color }) => (
            <Ionicons name="newspaper-outline" size={28} color={color} />
          ),
        }}
      />
      <Tabs.Screen
        name="radio"
        options={{
          title: "Radio",
          headerTitleAlign: "center",
          tabBarIcon: ({ color }) => (
            <Ionicons name="radio" size={28} color={color} />
          ),
        }}
      />
      <Tabs.Screen
        name="contact"
        options={{
        title: "Contacto",
        headerTitleAlign: "center",
        tabBarIcon: ({ color }) => (
         <Ionicons name="person-circle-outline" size={28} color={color} />
        ),
      }}
      />
      
    </Tabs>
  );
}
