def load_diagnoses
  puts "****************Loading sg_fever.json**********************"
  sg_fever_diagnoses = File.read("#{Rails.root}/data/sg_fever.json")
  sg_fever_diagnoses = JSON.parse(sg_fever_diagnoses)
  sg_fever_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'SG_FEVER'
        })
    else
      puts "#{diagnosis} already created under the category of SG_FEVER"
    end
  end

  puts "****************Loading sg_uri.json**************************"
  sg_uri_diagnoses = File.read("#{Rails.root}/data/sg_uri.json")
  sg_uri_diagnoses = JSON.parse(sg_uri_diagnoses)
  sg_uri_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'SG_URI'
        })
    else
      puts "#{diagnosis} already created under the category of SG_URI"
    end
  end

  puts "****************Loading sg_lri.json****************************"
  sg_lri_diagnoses = File.read("#{Rails.root}/data/sg_lri.json")
  sg_lri_diagnoses = JSON.parse(sg_lri_diagnoses)
  sg_lri_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'SG_LRI'
        })
    else
      puts "#{diagnosis} already created under the category of SG_LRI"
    end
  end

  puts "****************Loading sg_ri.json******************************"
  sg_ri_diagnoses = File.read("#{Rails.root}/data/sg_ri.json")
  sg_ri_diagnoses = JSON.parse(sg_ri_diagnoses)
  sg_ri_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'SG_RI'
        })
    else
      puts "#{diagnosis} already created under the category of SG_RI"
    end
  end

  puts "****************Loading sg_ugi.json******************************"
  sg_ugi_diagnoses = File.read("#{Rails.root}/data/sg_ugi.json")
  sg_ugi_diagnoses = JSON.parse(sg_ugi_diagnoses)
  sg_ugi_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'SG_UGI'
        })
    else
      puts "#{diagnosis} already created under the category of SG_UGI"
    end
  end

  puts "****************Loading sg_lgi.json******************************"
  sg_lgi_diagnoses = File.read("#{Rails.root}/data/sg_lgi.json")
  sg_lgi_diagnoses = JSON.parse(sg_lgi_diagnoses)
  sg_lgi_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'SG_LGI'
        })
    else
      puts "#{diagnosis} already created under the category of SG_LGI"
    end
  end
  
  puts "****************Loading sg_gi.json******************************"
  sg_gi_diagnoses = File.read("#{Rails.root}/data/sg_gi.json")
  sg_gi_diagnoses = JSON.parse(sg_gi_diagnoses)
  sg_gi_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'SG_GI'
        })
    else
      puts "#{diagnosis} already created under the category of SG_GI"
    end
  end

  puts "****************Loading ncd.json******************************"
  ncd_diagnoses = File.read("#{Rails.root}/data/ncd.json")
  ncd_diagnoses = JSON.parse(ncd_diagnoses)
  ncd_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'NCD'
        })
    else
      puts "#{diagnosis} already created under the category of NCD"
    end
  end

  puts "****************Loading idsr_dz.json******************************"
  idsr_dz_diagnoses = File.read("#{Rails.root}/data/idsr_dz.json")
  idsr_dz_diagnoses = JSON.parse(idsr_dz_diagnoses)
  idsr_dz_diagnoses.each do |diagnosis|
    diagnosis_exists = DiagnosisCategory.by_full_name(:key => diagnosis)
    if diagnosis_exists.blank?
      DiagnosisCategory.create({
          :full_name => diagnosis,
          :category => 'IDSR_DZ'
        })
    else
      puts "#{diagnosis} already created under the category of IDSR_DZ"
    end
  end
  
end
load_diagnoses