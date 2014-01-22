FosterPet.Models.Postshare = Backbone.Model.extend({
  parse: function (data) {
    if (data.user) {
      data.user = new FosterPet.Collections.Users(data.user);
    }
    if (data.pet) {
      data.pet = new FosterPet.Collections.Pets(data.pet);
    }
    if (data.post) {
      data.post = new FosterPet.Collections.Posts(data.post);
    }
    return data;
  },

  toJson: function() {
    var data = _.clone(this.attributes);
    data.unset('post');
    data.unset('user');
    data.unset('pet');
    return data;
  },

   url: function() {
     if (this.get('id')) {
       return "/postshares/" + this.get('id')
     } else {
       return "/postshares/"
     }
   }
});