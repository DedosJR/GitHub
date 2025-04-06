import { Stack } from 'expo-router/stack';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { Image } from 'react-native';

export default function Layout() {
  return (
    <Stack screenOptions={{
     headerStyle:{backgroundColor:'#ffcc00',},
     headerTintColor:'black',
     headerTitleStyle:{fontWeight:'light', fontSize:22,},
     
     }}>
      
      <Stack.Screen name="(tabs)"  options={{ title:'Atras', headerShown: false,}}  />
    </Stack>
  );
}
