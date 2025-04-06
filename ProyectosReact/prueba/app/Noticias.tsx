import React, { useState, useEffect } from "react";
import {
  View,
  Text,
  Image,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
  Dimensions,
} from "react-native";
import { useLocalSearchParams } from "expo-router";
import { decode } from "html-entities";
import RenderHtml from "react-native-render-html";

const PostDetail = () => {
  const params = useLocalSearchParams();
  const { title, content, image, date } = params;

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
        <Text style={styles.errorText}>
          No se encontraron detalles para este post.
        </Text>
      </View>
    );
  }
  const post: {
    title: string;
    content: string;
    image?: string;
    date: string;
  } = {
    title: title as string,
    content: content as string,
    image: image as string,
    date: (date as string) || new Date().toISOString(), // Si no hay fecha, usa la fecha actual
  };

  // Obtén el ancho de la pantalla
  const contentWidth = Dimensions.get("window").width - 30;

  return (
    <ScrollView style={styles.container}>
      {isLoading ? (
        <ActivityIndicator
          size="large"
          color="#ffcc00"
          style={styles.loading}
        />
      ) : (
        <>
          <Text style={styles.title}>
            {post.title.replace(/&#8211;/g, "_")}
          </Text>
          <Text style={styles.date}>
            {new Date(post.date).toLocaleDateString("es-ES", {
              year: "numeric",
              month: "long",
              day: "numeric",
            })}
          </Text>
          {image && typeof image === "string" ? (
            <Image source={{ uri: image }} style={styles.image} />
          ) : (
            <Text style={styles.noImageText}>No hay imagen disponible</Text>
          )}

          <View style={styles.htmlContent}>
            <RenderHtml
              contentWidth={contentWidth}
              source={{ html: post.content }}
              tagsStyles={{
                p: styles.paragraph,
                a: styles.link,
                img: styles.contentImage,
              }}
            />
          </View>
        </>
      )}
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: "#fff",
    height: "100%",
  },
  loading: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    marginTop: 50,
  },
  title: {
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 0,
    color: "black",
  },
  date: {
    fontSize: 14,
    color: "#666",
    marginBottom: 10,
    marginTop: 10,
  },
  image: {
    width: "100%",
    height: 200,
    borderRadius: 8,
    marginBottom: 10,
  },
  noImageText: {
    fontSize: 16,
    fontStyle: "italic",
    color: "#888",
    marginBottom: 10,
  },
  content: {
    fontSize: 14,
    lineHeight: 22,
    color: "black",
    marginBottom: 40,
    letterSpacing: 0.5,
  },
  errorContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#f9f9f9",
  },
  errorText: {
    fontSize: 18,
    color: "black",
    textAlign: "center",
  },
  htmlContent: {
    marginTop: 10,
    marginBottom: 40,
    letterSpacing: 0.5,
    //paddingHorizontal: 10,
  },
  paragraph: {
    fontSize: 16,
    lineHeight: 24,
    color: "black",
    marginBottom: 10,
  },
  link: {
    color: "#1e3c72",
    textDecorationLine: "underline",
  },
  contentImage: {
    width: "100%",
    height: "auto",
    marginVertical: 10,
  },
});

export default PostDetail;
