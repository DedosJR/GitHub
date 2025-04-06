import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Image } from 'react-native';
import { Audio } from 'expo-av';
import { MaterialIcons } from '@expo/vector-icons';

const RadioPlayer = ({ streamUrl }) => {
  const [sound, setSound] = useState(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    return sound
      ? () => {
          sound.unloadAsync();
        }
      : undefined;
  }, [sound]);

  async function playSound() {
    setIsLoading(true);
    try {
      if (sound) {
        if (isPlaying) {
          await sound.pauseAsync();
          setIsPlaying(false);
        } else {
          await sound.playAsync();
          setIsPlaying(true);
        }
      } else {
        const { sound: newSound } = await Audio.Sound.createAsync(
          { uri: streamUrl },
          { shouldPlay: true, staysActiveInBackground: true }
        );
        setSound(newSound);
        setIsPlaying(true);
      }
    } catch (error) {
      console.error('Error playing sound:', error);
    }
    setIsLoading(false);
  }

  return (
    <View style={styles.container}>
      <Image
        source={{ uri: 'https://api.a0.dev/assets/image?text=modern%20radio%20station%20logo&aspect=1:1' }}
        style={styles.logo}
      />
      <Text style={styles.statusText}>
        {isPlaying ? 'Reproduciendo' : 'Radio Detenida'}
      </Text>
      <TouchableOpacity
        style={styles.playButton}
        onPress={playSound}
        disabled={isLoading}
      >
        <MaterialIcons
          name={isPlaying ? 'pause' : 'play-arrow'}
          size={40}
          color="white"
        />
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    justifyContent: 'center',
    padding: 20,
  },
  logo: {
    width: 200,
    height: 200,
    borderRadius: 100,
    marginBottom: 30,
  },
  statusText: {
    color: 'white',
    fontSize: 18,
    marginBottom: 20,
  },
  playButton: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: 'rgba(255,255,255,0.2)',
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default RadioPlayer;