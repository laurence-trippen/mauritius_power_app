enum District {
  blackriver,
  flacq,
  grandport,
  moka,
  pamplemousses,
  plainewilhems,
  portlouis,
  rivieredurempart,
  savanne,
  rodrigues,
  unknown,
}

District getDistrictByString(String districtName) {
  return District.values.firstWhere(
    (district) => district.name == districtName,
    orElse: () => District.unknown,
  );
}
