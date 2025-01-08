import React, { useState, useEffect } from 'react';
import { View, Button, Text, Image, ActivityIndicator, StyleSheet } from 'react-native';
import { Audio } from 'expo-av';

const RadioScreen = () => {
  const [sound, setSound] = useState<any>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [songDetails, setSongDetails] = useState({
    title: 'Cargando...',
    artist: 'Cargando...',
    artUrl: '',
  });
  const [isLoading, setIsLoading] = useState(true);
  const streamUrl = 'https://server1.maxiradiofm.com:8000/radio.mp3';

  const fetchNowPlaying = async () => {
    try {
      setIsLoading(true);
      const response = await fetch('https://server1.maxiradiofm.com/api/station/1/nowplaying');
      const data = await response.json();

      if (data && data.now_playing && data.now_playing.song) {
        setSongDetails({
          title: data.now_playing.song.title || 'Sin título disponible',
          artist: data.now_playing.song.artist || 'Desconocido',
          artUrl: data.now_playing.song.art || '',
        });
      } else {
        console.error('Estructura de datos inesperada:', data);
        setSongDetails({ title: 'Sin canción', artist: 'Desconocido', artUrl: '' });
      }
    } catch (error) {
      console.error('Error al obtener datos:', error);
      setSongDetails({ title: 'Error', artist: 'Error', artUrl: '' });
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchNowPlaying();
    const interval = setInterval(fetchNowPlaying, 20000);
    return () => clearInterval(interval);
  }, []);

  const playStream = async () => {
    if (!streamUrl) return;
    const { sound } = await Audio.Sound.createAsync({ uri: streamUrl }, { shouldPlay: true });
    setSound(sound);
    setIsPlaying(true);
  };

  const stopStream = async () => {
    if (sound) {
      await sound.stopAsync();
      setIsPlaying(false);
    }
  };

  return (
    <View style={styles.container}>
      {isLoading ? (
        <ActivityIndicator size="large" color="#333" />
      ) : (
        <View>
         <Image source={{ uri: songDetails.artUrl }} style={styles.image} />
          <Text style={styles.title}>{songDetails.title}</Text>
          <Text style={styles.artist}>{songDetails.artist}</Text>
          {songDetails.artUrl }
        </View>
      )}
      <Button
        title={isPlaying ? 'Detener Radio' : 'Reproducir Radio'}
        onPress={isPlaying ? stopStream : playStream}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { alignItems: 'center', justifyContent: 'center', padding: 10,top: 90, },
  image: { width: 300, height: 300, borderRadius: 10, marginBottom: 10, justifyContent: 'center',},
  title: { fontSize: 20, fontWeight: 'bold', marginVertical: 5,textAlign: 'center' },
  artist: { fontSize: 14, color: '#555', marginBottom: 20, textAlign: 'center'  },
});

export default RadioScreen;