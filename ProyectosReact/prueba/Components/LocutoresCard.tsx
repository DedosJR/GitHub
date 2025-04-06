import React from "react";
import { View, Text, Image, StyleSheet, Dimensions } from "react-native";
import { LinearGradient } from "expo-linear-gradient";

const LocutoresCard = ({
  locutor,
}: {
  locutor: { id: string; title: string; image: any };
}) => {
  return (
    <View style={styles.card}>
      <Image source={locutor.image} style={styles.imagen} />
      <LinearGradient
        colors={["transparent", "rgba(0, 0, 0, 0.8)"]}
        style={styles.overlay}
      />
      <Text style={styles.titulo}>{locutor.title}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    width: Dimensions.get("window").width * 0.5,
    height: 400,
    borderRadius: 10,
    overflow: "hidden",
    marginHorizontal: 5,
  },
  imagen: {
    width: "100%",
    height: "100%",
    borderRadius: 10,
  },
  overlay: {
    position: "absolute",
    width: "100%",
    height: "100%",
    bottom: 0,
    borderRadius: 10,
  },
  titulo: {
    position: "absolute",
    bottom: 10,
    left: 10,
    color: "#fff",
    fontSize: 12,
    fontWeight: "bold",
  },
});

export default LocutoresCard;
