class VendorSerializer
  def self.format_vendor(vendor)
    {
      data: vendor_hash(vendor)
    }
  end

  private

  def vendor_hash(vendor)
    {
      id: vendor.id,
      type: 'vendor',
      attributes: {
        name: vendor.name,
        description: vendor.description,
        contact_name: vendor.contact_name,
        contact_phone: vendor.contact_phone,
        credit_accepted: vendor.credit_accepted
      }
    }
  end
end
