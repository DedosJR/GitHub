import axios from "axios";

const API_URL = "https://maxiradiofm.com/wp-json/wp/v2";

export const getNewsCategory = async (categoryId: number) => {
  try {
    const response = await axios.get(
      `${API_URL}/posts?categories=${categoryId}&_embed`
    );
    return response.data;
  } catch (error) {
    console.error("Error al obtener las noticias:", error);
    return [];
  }
};
