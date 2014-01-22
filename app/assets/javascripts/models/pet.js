FosterPet.Models.Pet = Backbone.Model.extend({
  urlRoot: '/pets',

  parse: function (data) {
    if (data.following) {
      data.following = new FosterPet.Models.Following(data.following);
    }
    if (data.followers) {
      data.followers = new FosterPet.Collections.Users(data.followers);
    }
    if (data.owners) {
      data.owners = new FosterPet.Collections.Users(data.owners);
    }
    if (data.public_photos) {
      data.public_photos = new FosterPet.Collections.Users(data.public_photos);
    }
    if (data.private_photos) {
      data.private_photos = new FosterPet.Collections.Users(data.private_photos);
    }
    return data;
  },

  toJson: function() {
    var data = _.clone(this.attributes);
    data.unset('following');
    data.unset('followers');
    data.unset('owners');
    data.unset('public_photos')
    data.unset('private_photos')
    return data;
  }
});