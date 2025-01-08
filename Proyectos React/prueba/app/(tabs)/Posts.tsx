import React, { useState, useEffect } from 'react';
import { View, Text, FlatList, Image, StyleSheet, TouchableOpacity, ActivityIndicator } from 'react-native';
import { useRouter } from 'expo-router';

type Post = {
  id: number;
  title: {
    rendered: string;
  };
  content: {
    rendered: string;
  };
  _embedded?: {
    'wp:featuredmedia'?: {
      source_url: string;
    }[];
  };
};

const NewsScreen = () => {
  const [posts, setPosts] = useState<Post[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const router = useRouter();

  const truncateText = (text: string, maxLength: number) => {
    const plainText = text.replace(/<[^>]+>/g, ''); // Elimina etiquetas HTML
    return plainText.length > maxLength
      ? plainText.substring(0, maxLength) + '...'
      : plainText;
  };

  useEffect(() => {
    fetch('https://maxiradiofm.com/wp-json/wp/v2/posts?_embed')
      .then((response) => response.json())
      .then((data) => {
        setPosts(data);
      })
      .catch((error) => console.error('Error fetching posts:', error))
      .finally(() => setIsLoading(false)); // Finaliza el estado de carga
  }, []);

  return (
    <View style={styles.container}>
      
      {isLoading ? (
        <ActivityIndicator size="large" color="#333" style={styles.loading} />
      ) : (
        
        <FlatList
          data={posts}
          keyExtractor={(item) => item.id.toString()}
          renderItem={({ item }) => (
            <TouchableOpacity
              onPress={() =>
                router.push({
                  pathname: '/Noticias',
                  params: {
                    title: item.title.rendered,
                    content: item.content.rendered,
                    image: item._embedded?.['wp:featuredmedia']?.[0]?.source_url || '',
                  },
                })
              }
            >
              <View style={styles.postContainer}>
                {item._embedded?.['wp:featuredmedia']?.[0]?.source_url && (
                  <Image
                    source={{ uri: item._embedded['wp:featuredmedia'][0].source_url }}
                    style={styles.image}
                  />
                )}
                <Text style={styles.title}>{item.title.rendered}</Text>
                {/* <Text style={styles.excerpt}>
                  {truncateText(item.content.rendered, 100)}
                </Text> */}
              </View>
            </TouchableOpacity>
          )}
        />
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f9f9f9',
    padding: 10,
  },
  loading: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  postContainer: {
    marginBottom: 10,
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
    marginBottom: 10,
  },
  excerpt: {
    fontSize: 14,
    color: '#666',
  },
});

export default NewsScreen;