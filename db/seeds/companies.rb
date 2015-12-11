Company.create!([
  { 
    name: "3sixD", title: "3sixd Consulting",
    description: "We create openings - Potential candidate apply for the job - We will hire the 
    succesfully candidate", 
    about: "3sixD is the site where recruiter posts various jobs to proffesionals/contractors online 
    and them depending on the job/service they are qualified for will apply for that job. Finally a 
    recruiter will be able to select the qualified pessonel depending on his needs for the job he 
    posted.", address1: "700 Craighead St", address2: "Suite 106", city: "Nashville", 
    state_id: State.find_by_code('TN'), zip: "37204", facebook: "https://facebook.com", 
    twitter: "https://twitter.com", google_plus: "https://plus.google.com", 
    linkedin: "https://www.linkedin.com", dribble: "https://dribbble.com", default: 'true'
  },
  { 
    name: "Furaha", title: "Furaha Software Inc,",
    description: "The center for Software Development - Hire us - We will provide you with the 
    best software in turn", 
    about: "Furaha Software Inc is one of the best software development company in the planet, 
    For more visit at <a href='http://www.furahasoftware.com/'>Furaha Web</a>", 
    address1: "701 Craighead St", address2: "Suite 107", city: "Nashville", 
    state_id: State.find_by_code('IL'), zip: "37207", facebook: "https://facebook.com", 
    twitter: "https://twitter.com", google_plus: "https://plus.google.com", 
    linkedin: "https://www.linkedin.com", dribble: "https://dribbble.com", default: 'false'
  }
])