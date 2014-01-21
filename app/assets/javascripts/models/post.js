FosterPet.Models.Post = Backbone.Model.extend({
  parse: function (data) {
    if (data.user) {
      data.user = new FosterPet.Collections.Users(data.user);
    }
    if (data.author) {
      data.author = new FosterPet.Collections.Users(data.author);
    }
    if (data.pet) {
      data.pet = new FosterPet.Collections.Pets(data.pet);
    }


    return data;
  },


  // parse: function (data) {
  //   if (data.user) {
  //     data.user = new FosterPet.Models.User(data.user);
  //   }
  //   if (data.pet) {
  //     data.pet = new FosterPet.Models.Pet(data.pet);
  //   }
  //   return data;
  // },

  toJson: function() {
    var data = _.clone(this.attributes);
    data.unset('user');
    data.unset('pet');
    return data;
  }
})