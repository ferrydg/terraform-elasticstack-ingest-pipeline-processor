variable "processor" {
  type = object({
    type           = string
    description    = optional(string)
    field          = optional(string)
    target_field   = optional(string)
    patterns       = optional(list(string))
    value          = optional(string)
    override       = optional(bool)
    formats        = optional(list(string))
    timezone       = optional(string)
    ignore_missing = optional(bool)
    first_only     = optional(bool)
    pipeline       = optional(string)
    source         = optional(string)
    params         = optional(map(string))
    if             = optional(string)
  })
}