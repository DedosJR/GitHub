import React from "react";
import { View, Text, Image, TouchableOpacity } from "react-native";

const NewsCard = ({ noticia }: { noticia: any }) => {
  const featuredImage =
    noticia._embedded?.["wp:featuredmedia"]?.[0]?.source_url;
  return (
    <TouchableOpacity style={{ padding: 10 }}>
      {featuredImage && (
        <Image
          source={{ uri: featuredImage }}
          style={{ width: "100%", height: 120, borderRadius: 8 }}
          resizeMode="cover"
        />
      )}
      <Text style={{ fontWeight: "bold", marginTop: 8 }}>
        {noticia.title.rendered}
      </Text>
      <Text numberOfLines={2} style={{ marginTop: 4 }}>
        {noticia.exerpert.rendered.replace(/<[^>]*>/g, "")}{" "}
        {/*para quitar las etiquetas html*/}
      </Text>
    </TouchableOpacity>
  );
};
export default NewsCard;
