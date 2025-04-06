import React, { useEffect, useState } from "react";
import {
  View,
  ActivityIndicator,
  Dimensions,
  Text,
  StyleSheet,
  FlatList,
} from "react-native";
import { getNewsCategory } from "../Services/wpApi";
import NewsCard from "./NewsCard";

const NewsCarousel = () => {
  const [news, setNews] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchNews = async () => {
      try {
        const categoryId = 23;
        const newsData = await getNewsCategory(categoryId);

        if (!newsData || !Array.isArray(newsData)) {
          throw new Error("Formato de datos incorrecto");
        }

        setNews(newsData);
      } catch (err) {
        console.error("Error al obtener noticias:", err);
        setError("Error al cargar las noticias");
      } finally {
        setLoading(false);
      }
    };

    fetchNews();
  }, []);

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#ffcc00" />
      </View>
    );
  }

  if (error) {
    return (
      <View style={styles.errorContainer}>
        <Text style={styles.errorText}>{error}</Text>
      </View>
    );
  }

  if (news.length === 0) {
    return (
      <View style={styles.emptyContainer}>
        <Text>No hay noticias disponibles</Text>
      </View>
    );
  }

  return (
    <View style={styles.carouselContainer}>
      <FlatList
        data={news.slice(0, 5)}
        keyExtractor={(item) => item.id.toString()}
        horizontal
        showsHorizontalScrollIndicator={false}
        renderItem={({ item }) => (
          <View style={styles.itemContainer}>
            <NewsCard noticia={item} />
          </View>
        )}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  loadingContainer: {
    height: 300,
    justifyContent: "center",
    alignItems: "center",
  },
  errorContainer: {
    height: 100,
    justifyContent: "center",
    alignItems: "center",
  },
  errorText: {
    color: "red",
  },
  emptyContainer: {
    height: 100,
    justifyContent: "center",
    alignItems: "center",
  },
  carouselContainer: {
    height: "auto",
    marginVertical: 20,
  },
  itemContainer: {
    width: 250,
    marginRight: 15,
  },
});

export default NewsCarousel;
