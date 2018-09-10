{% from "profile/map.jinja" import profile_settings with context %}

{% if 'profile' in profile_settings %}
{% if 'source' in profile_settings.profile or 'contents' in profile_settings.profile %}
{{ profile_settings.lookup.locations.profile }}:
  file.managed:
    {% if 'source' in profile_settings.profile %}
    - source: {{ profile_settings.profile.source }}
    {% else %}
    - contents: {{ profile_settings.profile.contents }}
    {% endif %}
    - user: root
    - group: root
    - mode: 0644
{% endif %}
{% endif %}

{% if 'profile_d' in profile_settings %}

{% if 'source' in profile_settings.profile_d %}
{{ profile_settings.lookup.locations.profile_d }}:
  file.recurse:
    - source: {{ profile_settings.profile_d.source }}
    - makedirs: True
    - clean: {{ profile_settings.profile_d.clean|default(False) }}
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: 0644
    - recurse:
      - user
      - group
      - mode
{% else %}
{{ profile_settings.lookup.locations.profile_d }}:
  file.directory:
    - makedirs: True
    - user: root
    - group: root
    - mode: 0755
{% endif %}

{% if 'files' in profile_settings.profile_d %}
{% for filename, file_config in profile_settings.profile_d.files.items() %}
{% if 'source' in file_config or 'contents' in file_config %}
{{ profile_settings.lookup.locations.profile_d }}/{{ filename }}:
  file.managed:
    {% if 'source' in file_config %}
    - source: {{ profile_settings.profile_d.source }}
    {% else %}
    - contents: {{ profile_settings.profile_d.contents }}
    {% endif %}
    - user: root
    - group: root
    - mode: 0644
    - require:
      - file: {{ profile_settings.lookup.locations.profile_d }}
{% endif %}
{% endfor %}
{% endif %}

{% endif %}

{# EOF #}
