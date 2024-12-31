import React, { useState, useEffect } from 'react';
import { View, Text, FlatList, Image, StyleSheet } from 'react-native';

type Post = {
  id: number;
  title: {
    rendered: string;
  };
  excerpt: {
    rendered: string;
  };
  _embedded?: {
    'wp:featuredmedia'?: {
      source_url: string;
    }[];
  };
};

const NewsScreen = () => {
  const [posts, setPosts] = useState<Post[]>([]); //Guarda el posts
  const truncateText = (text: string, maxLength: number) => {//Limita a ciertas letras
  const plainText = text.replace(/<[^>]+>/g, ''); // Elimina etiquetas HTML
  return plainText.length > maxLength
    ? plainText.substring(0, maxLength) + '...'
    : plainText;
  };
  useEffect(() => {
    fetch('https://maxiradiofm.com/wp-json/wp/v2/posts?_embed')
      .then((response) => response.json())
      .then((data) => {
        console.log('Datos de la API:', data); // Inspecciona la respuesta
        setPosts(data);
      })
      .catch((error) => console.error('Error fetching posts:', error));
  }, []);

  return (
    <View>
      <FlatList
        data={posts}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <View style={styles.postContainer}>
            {item._embedded?.['wp:featuredmedia']?.[0]?.source_url && (
              <Image
                source={{ uri: item._embedded['wp:featuredmedia'][0].source_url }}
                style={styles.image}
              />
            )}
            <Text style={styles.title}>{item.title.rendered}</Text> {/* Mostrar el título */}
            {/* <Text style={styles.postContainer}>{truncateText(item.excerpt.rendered, 100)}</Text> */}
          </View>
        )}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  postContainer: {
    marginBottom: 20,
    padding: 10,
    backgroundColor: '#fff',
    borderRadius: 5,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowOffset: { width: 0, height: 2 },
    shadowRadius: 5,
    elevation: 3,
  },
  image: {
    width: '100%',
    height: 200,
    borderRadius: 5,
    marginBottom: 10,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 20,
  },
});

export default NewsScreen;