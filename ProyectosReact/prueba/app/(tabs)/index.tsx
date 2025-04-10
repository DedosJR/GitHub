import {
  View,
  Text,
  StyleSheet,
  Image,
  ScrollView,
  Dimensions,
  FlatList,
  ActivityIndicator,
  TouchableOpacity,
} from "react-native";
import Carousel from "react-native-snap-carousel";
import { LinearGradient } from "expo-linear-gradient";
import React, { useEffect, useState } from "react";
import { MaterialIcons } from "@expo/vector-icons";
import NewsCarousel from "../../Components/NewsCarousel";

/**Componente que muestra una tarjeta de locutor..*/
const { width, width: screenWidth } = Dimensions.get("window");

const locutores = [
  {
    id: "1",
    title: "Las Inolvidables",
    image: require("../../assets/Inolvidables.jpg"),
  },
  { id: "2", title: "", image: require("../../assets/general.webp") },
  { id: "3", title: "", image: require("../../assets/general.webp") },
  { id: "4", title: "", image: require("../../assets/general.webp") },
];

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
      <Text style={styles.titulo}></Text>
    </View>
  );
};
/**Fin de componente que muestra una tarjeta de locutor..*/
const Tab = () => {
  return (
    <ScrollView>
      <View style={styles.container}>
        <Image
          source={require("../../assets/Header.jpg")}
          style={styles.image}
        />
        {/**Seccion de publicidad */}
        <View style={styles.bannercontainer}>
          <TouchableOpacity>
            <Image
              source={{
                uri: "https://maxiradiofm.com/banners/Banner-728.webp",
              }}
              style={styles.banners}
            />
          </TouchableOpacity>
        </View>
        {/**Seccion de locutores */}
        <Text style={styles.title}>
          <MaterialIcons name="calendar-today" size={20} color="black" />{" "}
          Programación
        </Text>
        <FlatList
          data={locutores}
          horizontal
          showsHorizontalScrollIndicator={false}
          keyExtractor={(item) => item.id}
          renderItem={({ item }) => <LocutoresCard locutor={item} />}
        />
      </View>
      {/**Seccion de noticias espectáculos */}
      <Text style={styles.title}>
        <MaterialIcons name="newspaper" size={20} color="black" /> Tendencia
      </Text>
      <NewsCarousel />
      {/**Seccion de podcast */}
      <Text style={styles.title}>
        <MaterialIcons name="podcasts" size={20} color="black" /> Podcast
      </Text>
    </ScrollView>
  );
};
/**CSS de componentes*/
const styles = StyleSheet.create({
  container: {
    top: 10,
    flex: 1,
    //justifyContent: "center",
    //alignItems: "center",
    backgroundColor: "#f2f3f4",
  },
  image: {
    width: "100%",
    height: 200,
    boxShadow: "0px 2px 4px rgba(0, 0, 0, 0.1)",
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 15,
    marginTop: 25,
    marginLeft: 10,
    color: "#000",
  },
  card: {
    width: width * 0.5,
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
  banners: {
    width: 400,
    height: 40,
    marginTop: 15,
    marginBottom: 10,
    alignSelf: "center",
  },
  bannercontainer: {
    width: "100%",
    height: 40,
    marginTop: 15,
    marginBottom: 10,
  },
});
export default Tab;
