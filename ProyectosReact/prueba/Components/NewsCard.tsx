import React from "react";
import { View, Text, Image, TouchableOpacity, StyleSheet } from "react-native";
import { useNavigation } from "@react-navigation/native";
import { Noticia } from "../app/types/wpTypes";

type Props = {
  noticia: Noticia;
};

const NewsCard = ({ noticia }: Props) => {
  const navigation = useNavigation();

  const handlePress = () => {
    navigation.navigate("Noticias", {
      title: noticia.title.rendered,
      content: noticia.content.rendered,
      image: noticia._embedded?.["wp:featuredmedia"]?.[0]?.source_url,
      date: noticia.date,
      id: noticia.id,
    });
  };

  const featuredImage =
    noticia._embedded?.["wp:featuredmedia"]?.[0]?.source_url;

  return (
    <TouchableOpacity
      style={styles.container}
      onPress={handlePress}
      activeOpacity={0.7}
    >
      {featuredImage ? (
        <Image
          source={{ uri: featuredImage }}
          style={styles.image}
          resizeMode="cover"
          defaultSource={require("../assets/favicon.png")} // Imagen de respaldo
          onError={() => console.log("Error cargando imagen")}
        />
      ) : (
        <View style={styles.placeholder}>
          <Text style={styles.placeholderText}>Sin imagen</Text>
        </View>
      )}
      <Text style={styles.date}>
        {new Date(noticia.date).toLocaleDateString("es-ES", {
          year: "numeric",
          month: "long",
          day: "numeric",
        })}
      </Text>
      <Text style={{ fontWeight: "bold", marginTop: 10, marginLeft: 5 }}>
        {noticia.title.rendered}
      </Text>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  container: {
    width: 250,
    height: 250,
    marginHorizontal: 8,
    backgroundColor: "#fff",
    borderRadius: 8,
    overflow: "hidden",
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  image: {
    width: "100%",
    height: 120,
  },
  placeholder: {
    width: "100%",
    height: 120,
    backgroundColor: "#f0f0f0",
    justifyContent: "center",
    alignItems: "center",
  },
  placeholderText: {
    color: "#888",
    fontSize: 12,
  },
  title: {
    padding: 10,
    fontWeight: "bold",
    fontSize: 14,
    color: "#333",
    textAlign: "center",
  },
  date: {
    fontSize: 12,
    color: "#666",
    marginTop: 10,
    textAlign: "left",
    marginLeft: 5,
  },
});

export default NewsCard;
