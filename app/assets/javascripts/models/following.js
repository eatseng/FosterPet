FosterPet.Models.Following = Backbone.Model.extend({
  url: function() {
    if (this.get('id')) {
      return "pets/" + this.get('pet_id') + "/followings/" + this.get('id');
    } else {
      return "pets/" + this.get('pet_id') + "/followings/";
    }
  }

});