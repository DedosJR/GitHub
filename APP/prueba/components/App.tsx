import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View,Image,} from 'react-native';
import NewsScreen from './Posts';

export default function App() {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <NewsScreen/>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#5634',
    alignItems: 'center',
    justifyContent: 'center',
    marginTop:70,
    padding:5,
  },
});

