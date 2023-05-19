class AutomaticTellerMachineSerializer
  include JSONAPI::Serializer

  set_id nil
  set_type :atm

  attributes :name,
             :address,
             :lat,
             :lon,
             :distance
end
