import React, { useState } from 'react';
import { Text, View,Image, StyleSheet, TouchableOpacity, ScrollView, Alert} from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';
import Save from 'react-native-vector-icons/Feather'
import OptionIcon from 'react-native-vector-icons/Feather'

export default function Card() {

  const [liked, setLiked] = useState(false);
  const [likes, setLikes] = useState(0);

  const handleLikePress = () => {
    setLikes(likes + 1);
    setLiked(!liked);
  };

  const handleCommentPress = () => {
    Alert.alert('Add a comment', 'Comentado!', [
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('OK Pressed')},
    ]);
  };

  const handleSharePress = () => {
    Alert.alert('Share to a friend', 'Shared!', [
      {
        text: 'Cancel',
        onPress: () => console.log('Cancel Pressed'),
        style: 'cancel',
      },
      {text: 'OK', onPress: () => console.log('Ok Pressed')}
    ]);
  };

  const handleSavePost = () => {
    Alert.alert('Post saved!')
  }
  
  return (
    <ScrollView style={styles.scrollView}>
      <View style={styles.container}>
        <View style={styles.container0}>
          <Image source={require('./images/brandInstagram.png')} style={{height: 50, width: 160}}/>
        </View>
        <View style={styles.container1}>
          <View style={styles.imagem}>
            <Image style={{width: 35, height: 35, borderRadius: 35}} source={require('./images/SQUARE.png')} />
          </View>
          <Text style={{marginTop:25}}>l_paganini</Text>
          <TouchableOpacity>
            <OptionIcon style={styles.optionIcon}name={'more-horizontal'} size={33}/>
          </TouchableOpacity>
        </View>
        <View style={styles.container2}>
          <View>
            <Image style={styles.img} source={require('../assets/img01.png')} style={{height: 400, width: 420}}/>
          </View>
        </View>
        <View style={styles.container3}>
          <TouchableOpacity>
            <View style={styles.likeButtonContainer}>
              <Icon size={33} name={liked ? 'heart' : 'heart-o'} color={liked ? 'red' : 'black'} onPress={handleLikePress}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleCommentPress}>
            <View style={styles.commentButtonContainer}>
              <Image source={require('./images/commentIcon.png')} style={{height: 30, width: 30}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSharePress}>
            <View style={styles.shareButtonContainer}>
              <Image source={require('./images/shareIcon.png')} style={{height: 30, width: 33}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSavePost}>
            <View style={styles.saveButtonContainer}>
              <Save size={35} name={'bookmark'}/>
            </View>
          </TouchableOpacity>
        </View>
        <View style={styles.container4}>
          <Text style={{paddingLeft: 10}}>
            {likes} Likes
          </Text>
          <Text style={{fontWeight: 'bold', marginLeft: 10, marginTop: 5}}>l_paganini    
            <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Paisagem de Milhões!!</Text>
          </Text>
          <TouchableOpacity>
            <Text style={{marginLeft: 10}}>Ver todos os 10 comentarios</Text>
          </TouchableOpacity>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>JhonnBrandon 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Que cenário lindo!</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>RegisPompeo 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Que lindoo! 😍</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>MathScalfo 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Viajante ele 🤣</Text>
            </Text>
          <Text style={{marginLeft: 10, fontSize: 10, marginTop: 5}}>2 DAYS AGO</Text>
        </View>
      </View>
      <View style={styles.container}>
        <View style={styles.container1}>
          <View style={styles.imagem}>
          <Image style={{width: 35, height: 35, borderRadius: 35}} source={require('./images/regina.jpg')} />
          </View>
          <Text style={{marginTop:25}}>RegisPompeo</Text>
          <TouchableOpacity>
            <OptionIcon style={styles.optionIcon}name={'more-horizontal'} size={33}/>
          </TouchableOpacity>
        </View>
        <View style={styles.container2}>
          <View>
            <Image style={styles.img} source={require('./images/postRegina.jpg')} style={{height: 400, width: 420}}/>
          </View>
        </View>
        <View style={styles.container3}>
          <TouchableOpacity>
            <View style={styles.likeButtonContainer}>
              <Icon size={33} name={liked ? 'heart' : 'heart-o'} color={liked ? 'red' : 'black'} onPress={handleLikePress}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleCommentPress}>
            <View style={styles.commentButtonContainer}>
              <Image source={require('./images/commentIcon.png')} style={{height: 30, width: 30}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSharePress}>
            <View style={styles.shareButtonContainer}>
              <Image source={require('./images/shareIcon.png')} style={{height: 30, width: 33}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSavePost}>
            <View style={styles.saveButtonContainer}>
              <Save size={35} name={'bookmark'}/>
            </View>
          </TouchableOpacity>
        </View>
        <View style={styles.container4}>
          <Text style={{paddingLeft: 10}}>
            {likes} Likes
          </Text>
          <Text style={{fontWeight: 'bold', marginLeft: 10, marginTop: 5}}>RegisPompeu
            <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Jon Snow S2</Text>
          </Text>
          <TouchableOpacity>
            <Text style={{marginLeft: 10}}>Ver todos os 10 comentarios</Text>
          </TouchableOpacity>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>l_paganini 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Parece um urso akakak 🤣</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>JhonnBrandon 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Qual a raça dele? 🤨</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>MathScalfo 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Olha a lingua! rsrs </Text>
            </Text>
          <Text style={{marginLeft: 10, fontSize: 10, marginTop: 5}}>2 DAYS AGO</Text>
        </View>
      </View>
      <View style={styles.container}>
        <View style={styles.container1}>
          <View style={styles.imagem}>
          <Image style={{width: 35, height: 35, borderRadius: 35}} source={require('./images/jhonn-photo.jpeg')} />
          </View>
          <Text style={{marginTop:25}}>JhonnBrandon</Text>
          <TouchableOpacity>
            <OptionIcon style={styles.optionIcon}name={'more-horizontal'} size={33}/>
          </TouchableOpacity>
        </View>
        <View style={styles.container2}>
          <View>
            <Image style={styles.img} source={require('./images/1682692516140.jpg')} style={{height: 380, width: 420}}/>
          </View>
        </View>
        <View style={styles.container3}>
          <TouchableOpacity>
            <View style={styles.likeButtonContainer}>
              <Icon size={33} name={liked ? 'heart' : 'heart-o'} color={liked ? 'red' : 'black'} onPress={handleLikePress}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleCommentPress}>
            <View style={styles.commentButtonContainer}>
              <Image source={require('./images/commentIcon.png')} style={{height: 30, width: 30}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSharePress}>
            <View style={styles.shareButtonContainer}>
              <Image source={require('./images/shareIcon.png')} style={{height: 30, width: 33}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSavePost}>
            <View style={styles.saveButtonContainer}>
              <Save size={35} name={'bookmark'}/>
            </View>
          </TouchableOpacity>
        </View>
        <View style={styles.container4}>
          <Text style={{paddingLeft: 10}}>
            {likes} Likes
          </Text>
          <Text style={{fontWeight: 'bold', marginLeft: 10, marginTop: 5}}>JhonnBrandon    
            <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Fica a dica pros devs!! </Text>
          </Text>
          <TouchableOpacity>
            <Text style={{marginLeft: 10}}>Ver todos os 10 comentarios</Text>
          </TouchableOpacity>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>MathScalfo 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Genial 👌</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>RegisPompeo 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Dá pra usar de graça?</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>l_paganini 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Até tirei print 🤣</Text>
            </Text>
          <Text style={{marginLeft: 10, fontSize: 10, marginTop: 5}}>2 DAYS AGO</Text>
        </View>
      </View>
      <View style={styles.container}>
        <View style={styles.container1}>
          <View style={styles.imagem}>
          <Image style={{width: 35, height: 35, borderRadius: 35}} source={require('./images/matheus.jpg')} />
          </View>
          <Text style={{marginTop:25}}>MathScalfo</Text>
          <TouchableOpacity>
            <OptionIcon style={styles.optionIcon}name={'more-horizontal'} size={33}/>
          </TouchableOpacity>
        </View>
        <View style={styles.container2}>
          <View>
            <Image style={styles.img} source={require('./images/postMatheus.jpg')} style={{height: 400, width: 420}}/>
          </View>
        </View>
        <View style={styles.container3}>
          <TouchableOpacity>
            <View style={styles.likeButtonContainer}>
              <Icon size={33} name={liked ? 'heart' : 'heart-o'} color={liked ? 'red' : 'black'} onPress={handleLikePress}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleCommentPress}>
            <View style={styles.commentButtonContainer}>
              <Image source={require('./images/commentIcon.png')} style={{height: 30, width: 30}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSharePress}>
            <View style={styles.shareButtonContainer}>
              <Image source={require('./images/shareIcon.png')} style={{height: 30, width: 33}}/>
            </View>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleSavePost}>
            <View style={styles.saveButtonContainer}>
              <Save size={35} name={'bookmark'}/>
            </View>
          </TouchableOpacity>
        </View>
        <View style={styles.container4}>
          <Text style={{paddingLeft: 10}}>
            {likes} Likes
          </Text>
          <Text style={{fontWeight: 'bold', marginLeft: 10, marginTop: 5}}>MathScalfo    
            <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Minha filhota 😍</Text>
          </Text>
          <TouchableOpacity>
            <Text style={{marginLeft: 10}}>Ver todos os 10 comentarios</Text>
          </TouchableOpacity>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>l_paganini 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Parabéns gatão 😍😍</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>RegisPompeo 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> A cara do pai 😊😍</Text>
            </Text>
            <Text style={{marginLeft: 10, fontWeight: 'bold'}}>JhonnBrandon 
              <Text style={{fontWeight: 'normal'}} numberOfLines={1}> Parabéns Matheus! Muita saúde 😁</Text>
            </Text>
          <Text style={{marginLeft: 10, fontSize: 10, marginTop: 5}}>2 DAYS AGO</Text>
        </View>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 30,
    paddingBottom: 20
  },
  container0: {
    marginTop: 30,
    paddingLeft: 10,
    backgroundColor: 'transparent',
    height: 50,
    width: 330,
    position: 'fixed'
  },
  container1: {
    width: 360,
    height: 50,
    backgroundColor: 'white',
    marginLeft: 10,
    flexDirection: 'row'
  },
  imagem: {
    width: 35,
    height: 35,
    backgroundColor: 'green',
    borderRadius: 35,
    marginTop: 15,
    marginRight: 10
  },
  optionIcon:{
    marginTop: 18,
    marginLeft: 200
  },
  container2: {
    backgroundColor: 'gray',
    marginTop: 10,
    marginLeft: 0
  },
  container3: {
    width: 360,
    height: 30,
    backgroundColor: 'transparent',
    marginTop: 10,
    marginLeft: 16,
    flexDirection: 'row'
  },
  likeButtonContainer:{
    height: 40,
    width: 40,
  },
  commentButtonContainer:{
    height: 50,
    width: 38
  },
  shareButtonContainer:{
    height: 50,
    width: 35
  },
  saveButtonContainer:{
     height: 40,
     width: 35,
     alignItems: 'flex-start',
     marginLeft: 210
  },
  container4: {
    width: 360,
    height: 120,
    backgroundColor: 'white',
    marginTop: 10,
    marginLeft: 9
  },
  img: {
    height: 350,
    width: 360,
    alignSelf: 'center'
  }
});
