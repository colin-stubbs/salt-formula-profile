Most of the time you will simply want something like this,
profile:
  profile_d:
    source: salt://files/profile.d
  skel:
    source: salt://files/skel
    clean: True

To overwrite everything that your distro puts there by default,

profile:
  profile:
    source: salt://files/profile
  profile_d:
    source: salt://files/profile.d
    clean: True
  skel:
    source: salt://files/skel
    clean: True

alternate example,

profile:
  profile:
    contents: "STRING BASED CONTENT HERE"
  profile_d:
    source: salt://files/profile.d
    clean: True
    files:
      filename.extension:
        source: salt://files/alt_profile.d/some_file.extension
      other_filename.extension:
        contents: "STRING BASED CONTENT HERE"
  skel:
    source: salt://files/skel
    clean: True
