import React, { useState, useEffect } from 'react';
import { View, Text, FlatList, Image, StyleSheet, TouchableOpacity, ActivityIndicator } from 'react-native';
import { useRouter } from 'expo-router';

type Post = {
  id: number;
  title: {
    rendered: string;
  };
  excerpt: {
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
  date: string;
};

const NewsScreen = () => {
  const [posts, setPosts] = useState<Post[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [isLoadingMore, setIsLoadingMore] = useState(false);
  const [hasMorePosts, setHasMorePosts] = useState(true);
  const router = useRouter();

  const fetchPosts = async (pageNumber: number) => {
    try {
      const response = await fetch(`https://maxiradiofm.com/wp-json/wp/v2/posts?_embed&page=${pageNumber}&per_page=10`);
      const data = await response.json();
      
      if (data.length === 0) {
        setHasMorePosts(false);
        return [];
      }
      return data;
    } catch (error) {
      console.error('Error fetching posts:', error);
      return [];
    }
  };

  const loadMorePosts = async () => {
    if (isLoadingMore || !hasMorePosts) return;
    
    setIsLoadingMore(true);
    const newPosts = await fetchPosts(page + 1);
    setPage(page + 1);
    setPosts([...posts, ...newPosts]);
    setIsLoadingMore(false);
  };

  useEffect(() => {
    const loadInitialPosts = async () => {
      const initialPosts = await fetchPosts(1);
      setPosts(initialPosts);
      setIsLoading(false);
    };
    loadInitialPosts();
  }, []);

  const renderFooter = () => {
    if (!isLoadingMore) return null;
    return (
      <View style={styles.footer}>
        <ActivityIndicator size="small" color="#333" />
      </View>
    );
  };

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
                    date: item.date // Pasa la fecha como parámetro
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
                
                <Text style={styles.postDate}>
                 {new Date(item.date).toLocaleDateString("es-ES", {
                  year: "numeric",
                  month: "long",
                  day: "numeric"
                })}
                 </Text>
              </View>
            </TouchableOpacity>
          )}
          onEndReached={loadMorePosts}
          onEndReachedThreshold={0.5}
          ListFooterComponent={renderFooter}
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
    fontSize: 16,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  excerpt: {
    fontSize: 14,
    color: '#666',
  },
  footer: {
    padding: 10,
    justifyContent: 'center',
    alignItems: 'center',
  },
  postDate: {
    fontSize: 14,
    color: '#666',
  },
});

export default NewsScreen;