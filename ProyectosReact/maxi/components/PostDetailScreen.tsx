import React from 'react';
import {
  View,
  Text,
  ScrollView,
  Image,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
} from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import RenderHtml from 'react-native-render-html';

const PostDetailScreen = ({ post, onClose }) => {
  const contentWidth = Dimensions.get('window').width - 30;
  
  const getImageUrl = (post) => {
    if (post._embedded && post._embedded['wp:featuredmedia']) {
      return post._embedded['wp:featuredmedia'][0].source_url;
    }
    return `https://api.a0.dev/assets/image?text=news${post.id}&aspect=16:9`;
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity onPress={onClose} style={styles.backButton}>
        <MaterialIcons name="arrow-back" size={24} color="#1e3c72" />
        <Text style={styles.backButtonText}>Volver</Text>
      </TouchableOpacity>
      
      <ScrollView style={styles.scrollView}>
        <Image
          source={{ uri: getImageUrl(post) }}
          style={styles.postImage}
        />
        
        <View style={styles.content}>
          <Text style={styles.title}>
            {post.title.rendered.replace(/&#8211;/g, "-")}
          </Text>
          <Text style={styles.date}>
            {new Date(post.date).toLocaleDateString("es-ES", {
              year: "numeric",
              month: "long",
              day: "numeric"
            })}
          </Text>
          
          <View style={styles.htmlContent}>
            <RenderHtml
              contentWidth={contentWidth}
              source={{ html: post.content.rendered }}
              tagsStyles={{
                p: styles.paragraph,
                a: styles.link,
                img: styles.contentImage,
              }}
            />
          </View>
        </View>
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  backButton: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 15,
    borderBottomWidth: 1,
    borderBottomColor: '#eee',
  },
  backButtonText: {
    marginLeft: 10,
    fontSize: 16,
    color: '#1e3c72',
  },
  scrollView: {
    flex: 1,
  },
  postImage: {
    width: '100%',
    height: 250,
    backgroundColor: '#f0f0f0',
  },
  content: {
    padding: 15,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 10,
  },
  date: {
    fontSize: 14,
    color: '#666',
    marginBottom: 20,
  },
  htmlContent: {
    marginTop: 10,
  },
  paragraph: {
    fontSize: 16,
    lineHeight: 24,
    color: '#444',
    marginBottom: 15,
  },
  link: {
    color: '#1e3c72',
    textDecorationLine: 'underline',
  },
  contentImage: {
    width: '100%',
    height: 'auto',
    marginVertical: 10,
  },
});

export default PostDetailScreen;