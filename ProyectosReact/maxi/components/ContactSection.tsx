import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Image,
  Linking,
} from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';

const ContactSection = () => {
  const handleContact = async (type) => {
    switch (type) {
      case 'phone':
        await Linking.openURL('tel:+123456789');
        break;
      case 'whatsapp':
        await Linking.openURL('whatsapp://send?phone=123456789');
        break;
      case 'email':
        await Linking.openURL('mailto:contact@maxiradiofm.com');
        break;
    }
  };

  return (
    <View style={styles.container}>
      <Image
        source={{
          uri: 'https://api.a0.dev/assets/image?text=contact%20us%20customer%20service&aspect=16:9',
        }}
        style={styles.headerImage}
      />

      <View style={styles.content}>
        <Text style={styles.title}>Contáctanos</Text>
        <Text style={styles.subtitle}>
          Estamos aquí para ayudarte. Elige tu método de contacto preferido.
        </Text>

        <TouchableOpacity
          style={styles.contactButton}
          onPress={() => handleContact('phone')}
        >
          <MaterialIcons name="phone" size={24} color="#1e3c72" />
          <Text style={styles.buttonText}>Llamar</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.contactButton}
          onPress={() => handleContact('whatsapp')}
        >
          <MaterialIcons name="chat" size={24} color="#1e3c72" />
          <Text style={styles.buttonText}>WhatsApp</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.contactButton}
          onPress={() => handleContact('email')}
        >
          <MaterialIcons name="email" size={24} color="#1e3c72" />
          <Text style={styles.buttonText}>Email</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  headerImage: {
    width: '100%',
    height: 200,
  },
  content: {
    padding: 20,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 10,
  },
  subtitle: {
    fontSize: 16,
    color: '#666',
    marginBottom: 30,
  },
  contactButton: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 15,
    backgroundColor: '#f8f9fa',
    borderRadius: 10,
    marginBottom: 15,
    borderWidth: 1,
    borderColor: '#e9ecef',
  },
  buttonText: {
    marginLeft: 15,
    fontSize: 16,
    color: '#333',
  },
});

export default ContactSection;