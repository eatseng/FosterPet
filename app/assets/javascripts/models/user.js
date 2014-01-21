FosterPet.Models.User = Backbone.Model.extend({
  parse: function (data) {
   if (data.following_pets) {
     data.following_pets = new FosterPet.Collections.Pets(data.following_pets);
   }
   if (data.owned_pets) {
     data.owned_pets = new FosterPet.Collections.Pets(data.owned_pets);
   }
   return data;
 },

 toJson: function() {
   var data = _.clone(this.attributes);
   data.unset('following_pets');
   data.unset('owned_pets');
   return data;
 }
});