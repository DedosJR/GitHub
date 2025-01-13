import React, { useState, useEffect } from 'react';
import { View, Text, Image, StyleSheet, ScrollView, ActivityIndicator } from 'react-native';
import { useLocalSearchParams } from 'expo-router';

const PostDetail = () => {
  const params = useLocalSearchParams();
  const { title, content, image } = params;

  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    // Simula un tiempo de carga para el contenido
    const timer = setTimeout(() => setIsLoading(false), 500); // 2 segundos de simulación
    return () => clearTimeout(timer); // Limpia el temporizador al desmontar el componente
  }, []);

  // Validación de parámetros
  if (!title || !content) {
    return (
      <View style={styles.errorContainer}>
        <Text style={styles.errorText}>No se encontraron detalles para este post.</Text>
      </View>
    );
  }

  const myString: string = content as string;
  const cleanedContent = myString.replace(/<[^>]+>/g, '');

  return (
    <ScrollView style={styles.container}>
      {isLoading ? (
        <ActivityIndicator size="large" color="#333" style={styles.loading} />
      ) : (
        <>
          <Text style={styles.title}>{title}</Text>
          {image && typeof image === 'string' ? (
            <Image source={{ uri: image }} style={styles.image} />
          ) : (
            <Text style={styles.noImageText}>No hay imagen disponible</Text>
          )}
          <Text style={styles.content}>{cleanedContent}</Text>
        </>
      )}
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: '#fff',
  },
  loading: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 50,
  },
  title: {
    fontSize: 26,
    fontWeight: 'bold',
    marginBottom: 10,
    color: 'black',
  },
  image: {
    width: '100%',
    height: 200,
    borderRadius: 8,
    marginBottom: 10,
  },
  noImageText: {
    fontSize: 16,
    fontStyle: 'italic',
    color: '#888',
    marginBottom: 10,
  },
  content: {
    fontSize: 14,
    lineHeight: 22,
    color: 'black',
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f9f9f9',
  },
  errorText: {
    fontSize: 18,
    color: '#d9534f',
    textAlign: 'center',
  },
});

export default PostDetail;