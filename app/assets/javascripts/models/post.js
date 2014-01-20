FosterPet.Models.Post = Backbone.Model.extend({
  parse: function (data) {
    if (data.user) {
      data.user = new FosterPet.Models.User(data.user);
    }
    if (data.pet) {
      data.pet = new FosterPet.Models.Pet(data.pet);
    }
    return data;
  },

  toJson: function() {
    var data = _.clone(this.attributes);
    data.unset('user');
    data.unset('pet');
    return data;
  }  
})