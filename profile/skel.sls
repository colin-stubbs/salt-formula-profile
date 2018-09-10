{% from "profile/map.jinja" import profile_settings with context %}

{% if 'skel' in profile_settings and 'source' in profile_settings.skel %}
skel-content:
  file.recurse:
    - name: {{ profile_settings.lookup.locations.skel }}
    - source: {{ profile_settings.skel.source }}
    - makedirs: True
    - include_empty: True
    - clean: {{ profile_settings.skel.clean|default(False) }}
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
{% endif %}

{# EOF #}
