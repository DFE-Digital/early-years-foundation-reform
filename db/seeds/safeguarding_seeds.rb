# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown = <<-MARKDOWN
Content for Safeguarding to be completed
MARKDOWN

attrs = {
  title: "Safeguarding",
  markdown: markdown,
  position: 9,
}
parent_page = ContentPage.new attrs
parent_page.save!

#####################################################################################
# Child pages below
#
markdown = <<-MARKDOWN

Find out about promoting oral health as part of the early years foundation stage (EYFS).


##Why oral health is included in the EYFS framework

This has been included because good oral health habits need to be formed from the earliest age. Tooth decay is largely preventable, but it’s still a serious problem among young children.

Nearly a quarter of 5 year olds in England have tooth decay, with 3 or 4 teeth affected on average. Tooth extraction is one of the most common procedures for children under 6 in hospital. Extraction is also the most common reason for hospital admission for children aged 6 to 10. Children from more deprived backgrounds are more likely to have tooth decay. 

Children who have toothache, or need treatment, may have pain or infections. This can have a wider effect and lead to problems eating, sleeping, socialising and learning.

##Promoting oral health

You can decide how you promote oral health, based on what works best in your setting. Ideally, you can link oral health to things you already promote, like self-care, healthy eating and physical development.

Be playful with children about oral health. Suggest they brush the teeth of dolls or soft toys. Read stories about teeth and smiles. Talk about healthy food and drinks that help to grow strong teeth, and those that do not. Get them to look at their own and each other’s teeth, using mirrors.

Talk about tooth brushing with fluoride toothpaste as children arrive. Give parents and carers knowledge and practical advice to support oral health at home.

You can also support children’s awareness of oral health by:

- visiting dentists or having them visit you
- providing or showing toothbrushing kits
- showing toothbrushing routines 

##Supervised toothbrushing

You can decide if you want to bring in supervised toothbrushing. There are various schemes that support this. Speak to your [local authority](https://www.gov.uk/find-local-council) about it and read the [supervised tooth brushing programme toolkit](https://www.gov.uk/government/publications/improving-oral-health-supervised-tooth-brushing-programme-toolkit) from Public Health England.

If you decide to introduce supervised toothbrushing, read the [guidance on supervised toothbrushing during coronavirus (COVID-19).](https://www.gov.uk/government/publications/covid-19-supervised-toothbrushing-programmes)

##Useful resources

[Public Health England: health matters child dental health](https://www.gov.uk/government/publications/health-matters-child-dental-health), guidance to help you prevent tooth decay in children under 5, including links to e-learning.

[Children's Oral Health: healthcare e-learning](https://www.e-lfh.org.uk/programmes/childrens-oral-health/), aimed at parents, early years healthcare workers, teachers, nurses, GPs and the public.

[Oral Health Foundation: early years foundation stage](https://www.e-lfh.org.uk/programmes/childrens-oral-health/), how children can keep their mouth healthy and the best way to brush your teeth.

[Improving oral health in early years](https://pathways.nice.org.uk/pathways/oral-health-improvement-for-local-authorities-and-their-partners/improving-oral-health-in-early-years-services-including-nurseries): National Institute for Health and Care Excellence Pathways.

PACEY’s [oral health advice: includes factsheet for parents.](https://www.pacey.org.uk/working-in-childcare/spotlight-on/oral-health/)

PACEY's [nutrition spotlight](https://www.pacey.org.uk/working-in-childcare/spotlight-on/nutrition/), encouraging healthy eating habits.

[Delivering oral health from Public Health England](https://www.gov.uk/government/publications/delivering-better-oral-health-an-evidence-based-toolkit-for-prevention), includes a quick guide to healthy mouths in children.

[Change4life children’s centre toolkit](https://campaignresources.phe.gov.uk/resources/campaigns/84/resources/4299) from Public Health England, for promoting healthy eating and dental health.
MARKDOWN

attrs = {
  title: "Oral Health",
  markdown: markdown,
  position: 1,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!

#####################################################################################
#
#
markdown = <<-MARKDOWN

##Why is food safety so important for young children?

The [EYFS framework](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2) requires providers to take all necessary steps to keep children safe and well – and you must be confident that those responsible for preparing and handling food in your setting are competent to do so.  

Tragically, a child dies in the UK every month from choking and hundreds more require hospital treatment.  It can happen quickly and it can happen to anyone.
 
Babies and young children’s immune systems are not as strong and developed as adult’s which means they are more vulnerable to infections which can lead to food poisoning.  It is important to take extra care with hygiene and preparing food safely.

##What it says in the EYFS framework

Staffing arrangements must meet the needs of all children and ensure their safety. You must ensure that children are adequately supervised, including whilst eating.

Before a child is admitted to the setting, you must obtain information about any special dietary requirements, preferences and food allergies that the child has, and any special health requirements.

There must be an area which is adequately equipped to provide healthy meals, snacks and drinks for children as necessary. There must be suitable facilities for the hygienic preparation of food for children, if necessary including suitable sterilisation equipment for babies’ food. You must be confident that those responsible for preparing and handling food are competent to do so. In group provision, all staff involved in preparing and handling food must receive training in food hygiene.

[Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), pages 28 and 33.

##Food safety advice for children age 5 and under

###How to reduce the risk of choking

Food preparation:

- remove any stones and pips from fruit before serving
- cut small round foods, like grapes, strawberries and cherry tomatoes, lengthways and into quarters
- cut large fruits like melon, and hard fruit or vegetables like raw apple and carrot into slices instead of small chunks
- do not offer raisins as a snack to children under 12 months – although these can be chopped up as part of a meal
- soften hard fruit and vegetables (such as carrot and apple) and remove the skins when first given to babies from around 6 months
- sausages should be avoided due to their high salt content, but if offered to children these should be cut into thin strips rather than chunks and remove the skins
- remove bones from meat or fish
- do not give whole nuts to children under five years old
- do not give whole seeds to children under five years old
- cut cheese into strips rather than chunks
- do not give popcorn as a snack
- do not give children marshmallows or jelly cubes from a packet either to eat or as part of messy play activities as they can get stuck in the throat
- do not give children hard sweets

###Supervision

Infants and young children should be seated safely in a highchair or appropriately sized low chair while eating.  Infants and young children should never be left alone while they are eating, and staff should be familiar with paediatric first aid advice for children who are choking.

The criteria for effective Paediatric First Aid (PFA) training can be found in the [Statutory framework for the early years foundation stage](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), Annex A.

###Useful resources

- [Child Accident Prevention Trust - choking avoidance poster](https://www.capt.org.uk/Handlers/Download.ashx?IDMF=9133d866-5a33-4bea-8133-40801d70c1f1&utm_source=CAPT%20safety%20pages&utm_medium=CAPT%20news&utm_campaign=Choking&utm_term=Finger%20Food%20Without%20The%20Fear&utm_content=PDF%20Free%20Download)
- [Choking hazards in the home and how to avoid them (rospa.com)](https://www.rospa.com/rospaweb/docs/advice-services/home-safety/choking-hazards.pdf)

##Food and drinks to avoid

###Drinks

Provide only fresh tap water and plain milk for children to drink.  Fruit juice, smoothies, squash, fizzy drinks and flavoured milk, even when diluted, contain lots of sugar and can cause tooth decay. Diet or reduced-sugar drinks are not recommended for babies and toddlers either. For older children, these drinks can fill children up so they’re not hungry for healthier food.

When offering dairy alternatives to cow’s milk:

- Unsweetened calcium-fortified, plant-based drinks (such as soya, oat and almond drinks) should be avoided before 12 months, however small amounts can be used in cooking. These drinks can be given from 12 months as part of a healthy balanced diet. 
- Do not give children under 5 rice drinks, because of the level of arsenic they contain.

###Foods to avoid before around 6 months of age

Ideally, babies should be introduced to solid foods from around 6 months of age.  If parents or carers have decided to introduce solid foods to their child before 6 months of age, you will need to work closely with them to ensure a consistent and safe approach.  

It is important to remember that there are some foods which should not be given before 6 months of age:

- cow’s milk
- eggs
- foods containing wheat or gluten, including wheat, barley and rye (for example bread, pasta)
- nuts, peanuts and peanut products
- seeds
- fish and shellfish
- honey – avoid honey until 12 months old
- if a baby is less than 6 months old, sterilise water by boiling it first and then letting it cool right down - once a baby is 6 months old, this is no longer necessary

###Foods to avoid up to 12 months

- honey for infants under 1 year, as it occasionally contains bacteria which can make them ill

###Foods to avoid up to 5 years

- **Nuts**, especially peanuts, can cause severe allergic reactions in some children and all settings should have an allergy plan in place. Whole nuts, peanuts and seeds should not be given to children under 5 years old as they pose a choking risk.
- **Raw eggs**, or food containing partially cooked eggs, for example uncooked cake mixture and runny boiled eggs (unless they have the red lion stamp or you see the words “British Lion quality”).
- **Foods high in salt** such as: sausages, bacon, crackers, crisps, ready meals and takeaways.
- **Sugar** – both in sugary snacks and by not adding sugar to food.
- **Foods high in saturated fat** such as biscuits, crisps and cakes.
- **Fresh pate** (meat, fish or vegetable-based) to reduce the risk of food poisoning.
- **Unpasteurised milk, milk drinks and cheese**, mould-ripened cheeses and soft blue-veined cheese, to reduce the risk of food poisoning.  However, these cheeses can be used as part of a cooked recipe as listeria is killed by cooking.
- **Shark, swordfish and marlin** as the levels of mercury in these fish can affect a child’s developing nervous system.
- **Raw shellfish** to reduce the risk of food poisoning, and make sure any shellfish you use is thoroughly cooked.
- **Raw jelly cubes** – these are a choking hazard.

###Foods to serve occasionally from 6 months to 4 years

- Although it is recommended to provide oily fish in early years settings at least once every 3 weeks, do not provide it more than twice a week, as it can contain low levels of pollutants.

##Useful resources

- [Foods to avoid giving babies and young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/foods-to-avoid-giving-babies-and-young-children/)
- [What to feed young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/what-to-feed-young-children/)
- [Baby and toddler meal ideas - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/baby-and-toddler-meal-ideas/)
- [Eat-Better-Start-Better1.pdf (foundationyears.org.uk)](https://foundationyears.org.uk/wp-content/uploads/2017/11/Eat-Better-Start-Better1.pdf)
- [Example menus for early years settings in England - Part 1: Guidance](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/658870/Early_years_menus_part_1_guidance.pdf)
- [Example menus for early years settings in England - Part 2: Recipes](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/658872/Early_years_menus_part_2_recipes.pdf)

##Safe weaning

Progression from the introduction of first foods (at about 6 months), to a range of blended or mashed foods, and then to a wider range of chopped or minced foods should be a gradual process, based on each infants’ developmental readiness, rather than a staged process based on age alone.

[Start4Life](https://www.nhs.uk/start4life/weaning/) have lots of helpful information for parents regarding safe weaning, which you will also find it helpful to refer to.  

##How to prepare infant formula bottles

Good hygiene is very important when making up a formula feed.  Babies’ immune systems are not as strong as adults’ therefore all bottles, teats and feeding equipment need to be washed and sterilised before each feed.  The NHS has a helpful step by step guide on how to prepare infant formula.

##Useful resources

- [Your baby's first solid foods - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/babys-first-solid-foods/)
- [Help your baby enjoy new foods - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/help-your-baby-enjoy-new-foods/)
- [Drinks and cups for babies and young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/drinks-and-cups-for-babies-and-young-children/)
- [How to make up baby formula - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/breastfeeding-and-bottle-feeding/bottle-feeding/making-up-baby-formula/)

##Allergies

Early years settings and your food provider should work closely with families to support children with allergies or intolerances. As part of the [EYFS framework](https://www.gov.uk/government/publications/early-years-foundation-stage-framework--2), you are required to obtain information about children’s special dietary requirements – including food allergies and intolerances – before they attend, and record and act on the information provided about children’s dietary needs.
 
There should be a protocol in place which is accessible to all staff, to ensure everyone is aware of individual children’s allergies and symptoms.
 
Understanding which allergens are present in every meal and snack you provide is an important step in providing food which is safe for children with food allergies and intolerances. Since 2014, all food businesses, including early years settings, have been required by law to give details about the allergens in the food they provide.

##Useful resources

- [Food allergies in babies and young children - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/food-allergies-in-babies-and-young-children/)

- [Food allergy - NHS](https://www.nhs.uk/conditions/food-allergy/)

- [Allergy UK National Charity Free Allergy Support & Resources](https://www.allergyuk.org/)

- [Allergen guidance for food businesses Food Standards Agency](https://www.food.gov.uk/business-guidance/allergen-guidance-for-food-businesses)

- [Eat Better, Start Better From pregnancy to children aged 5 (foundationyears.org.uk)](https://foundationyears.org.uk/eat-better-start-better/)

##Hygiene

Food should be stored, prepared and presented in a safe and hygienic environment. This is especially important when providing food for young children, as they may have a low resistance to food poisoning. It is also important that children are taught basic hygiene themselves, such as not eating food that has fallen on the floor, and washing their hands with soap and warm water before eating meals or snacks and after going to the toilet or handling animals.

Ensure food is cooked until steaming hot to kill harmful bacteria, and is then cooled sufficiently before giving it to infants and young children.

Wash all surfaces for preparing or eating food, especially chopping boards, with hot soapy water (and keep pets away from them). Make sure all bowls and spoons are washed with hot soapy water. Tea towels, kitchen cloths or sponges can harbour lots of germs, so wash them regularly.

Further information on food hygiene:

- [Children's food: safety and hygiene - NHS (www.nhs.uk)](https://www.nhs.uk/conditions/baby/weaning-and-feeding/childrens-food-safety-and-hygiene/)
- [Safer food, better business (SFBB) Food Standards Agency](https://www.food.gov.uk/business-guidance/safer-food-better-business-sfbb)
- [Safer food, better business for childminders Food Standards Agency](https://www.food.gov.uk/business-guidance/safer-food-better-business-for-childminders) 

MARKDOWN

attrs = {
  title: "Food Safety",
  markdown: markdown,
  position: 2,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!

#####################################################################################
# rubocop:enable Layout/HeredocIndentation
