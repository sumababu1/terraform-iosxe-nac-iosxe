resource "iosxe_bfd" "bfd" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].bfd, null) != null }
  device   = each.value.name

  ipv4_both_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv4_maps, []) : {
    dst_vrf       = try(e.destination_vrf, local.defaults.iosxe.configuration.bfd.ipv4_maps.destination_vrf, null)
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.destination_prefix, null)
    src_vrf       = try(e.source_vrf, local.defaults.iosxe.configuration.bfd.ipv4_maps.source_vrf, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.source_prefix, null)
    template_name = e.template
  } if try(e.source_vrf, null) != null && try(e.destination_vrf, null) != null]

  ipv4_without_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv4_maps, []) : {
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.destination_prefix, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.source_prefix, null)
    template_name = e.template
  } if try(e.source_vrf, null) == null && try(e.destination_vrf, null) == null]

  ipv4_with_src_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv4_maps, []) : {
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.destination_prefix, null)
    src_vrf       = try(e.source_vrf, local.defaults.iosxe.configuration.bfd.ipv4_maps.source_vrf, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.source_prefix, null)
    template_name = e.template
  } if try(e.source_vrf, null) != null && try(e.destination_vrf, null) == null]

  ipv4_with_dst_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv4_maps, []) : {
    dst_vrf       = try(e.destination_vrf, local.defaults.iosxe.configuration.bfd.ipv4_maps.destination_vrf, null)
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.destination_prefix, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv4_maps.source_prefix, null)
    template_name = e.template_name
  }]

  ipv6_with_both_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv6_maps, []) : {
    dst_vrf       = try(e.destination_vrf, local.defaults.iosxe.configuration.bfd.ipv6_maps.destination_vrf, null)
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.destination_prefix, null)
    src_vrf       = try(e.source_vrf, local.defaults.iosxe.configuration.bfd.ipv6_maps.source_vrf, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.source_prefix, null)
    template_name = e.template
  } if try(e.source_vrf, null) != null && try(e.destination_vrf, null) != null]

  ipv6_without_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv6_maps, []) : {
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.destination_prefix, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.source_prefix, null)
    template_name = e.template
  } if try(e.source_vrf, null) == null && try(e.destination_vrf, null) == null]

  ipv6_with_src_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv6_maps, []) : {
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.destination_prefix, null)
    src_vrf       = try(e.source_vrf, local.defaults.iosxe.configuration.bfd.ipv6_maps.source_vrf, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.source_prefix, null)
    template_name = e.template
  } if try(e.source_vrf, null) != null && try(e.destination_vrf, null) == null]

  ipv6_with_dst_vrfs = [for e in try(local.device_config[each.value.name].bfd.ipv6_maps, []) : {
    dst_vrf       = try(e.destination_vrf, local.defaults.iosxe.configuration.bfd.ipv6_maps.destination_vrf, null)
    dest_ip       = try(e.destination_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.destination_prefix, null)
    src_ip        = try(e.source_prefix, local.defaults.iosxe.configuration.bfd.ipv6_maps.source_prefix, null)
    template_name = e.template_name
  }]

  slow_timers = try(local.device_config[each.value.name].bfd.slow_timers, local.defaults.iosxe.configuration.bfd.slow_timers, null)
}
