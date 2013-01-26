#import <Foundation/Foundation.h>


/*Fonctionalité 1
 Display des informations du path.*/
void displayPathInfo(){
    NSLog(@"Fonctionalité 1:");
    
    NSString *path = @"~";
    NSString *completedPath = [path stringByExpandingTildeInPath];
    for (NSString *pathComponent in [completedPath pathComponents]) {
        NSLog(@"%@\n", pathComponent);
    }
    
    NSLog(@"------------------------------------------\n\n");
}


//Fonctionalité 2
void displayProcessInfo() {
    NSLog(@"Fonctionalité 2:");
    
    NSProcessInfo *procInfo = [NSProcessInfo processInfo];
    NSLog(@"'%@' Process ID: '%i'\n", [procInfo processName], [procInfo processIdentifier]);
    
    NSLog(@"------------------------------------------\n\n");
}


//Fonctionalité 3
void displayBookmarkInfo() {
    NSLog(@"Fonctionalité 3:");
    
    //Création du dictionnaire et ajout des clés/valeurs
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:[NSURL URLWithString:@"http://etsmtl.ca"] forKey:@"École de technologie supérieure"];
    [dict setObject:[NSURL URLWithString:@"http://polymtl.ca"] forKey:@"École polytechnique de Montréal"];
    [dict setObject:[NSURL URLWithString:@"http://cours.logti.etsmtl.ca/log350/"] forKey:@"LOG350"];
    [dict setObject:[NSURL URLWithString:@"http://ville.montreal.qc.ca"] forKey:@"Ville de Montréal"];
    [dict setObject:[NSURL URLWithString:@"http://montrealenlumiere.com"] forKey:@"Montréal en lumières"];
    [dict setObject:[NSURL URLWithString:@"http://petiteecole.com"] forKey:@"La petite école"];
    
    //On itère de façon a afficher la valeur si la clé débute ou se termine par 'école'.
    for (NSString *entry in dict) {
        NSString *lowercaseEntry = [entry lowercaseString];
        if([lowercaseEntry hasPrefix:@"école"] || [lowercaseEntry hasSuffix:@"école"]) {
            NSLog(@"Clé: '%@' URL:'%@'\n", entry, [dict valueForKey:entry]);
        }
    }
    
    NSLog(@"------------------------------------------\n\n");
}


//Fonctionalité 4
void displayIntrospection() {
    NSLog(@"Fonctionalité 4:");
    
    //On crée un tableau mutable et on y ajoute divers objets
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:@"TestString"];
    [array addObject:[NSString stringWithUTF8String:"Something."]];
    [array addObject:[NSURL URLWithString:@"http://google.ca"]];
    [array addObject:[NSMutableDictionary new]];
    [array addObject:[NSProcessInfo processInfo]];
    [array addObject:[NSMutableData new]];
    
    //Pour chaque objet du tableau, on vérifie certaines caractéristiques
    //d'introspection et on les affiche dans un Log.
    for(id object in array){
        NSLog(@"Classe: %@", NSStringFromClass([object class]));
        NSLog(@"Est membre de NSString: %@", [object isKindOfClass:[NSString class]]? @"OUI": @"NON" );
        NSLog(@"Une sorte de NSString: %@", [object isMemberOfClass:[NSString class]]? @"OUI": @"NON" );
        
        if([object respondsToSelector:@selector(lowercaseString)]) {
            NSLog(@"Répond a lowercaseString: OUI");
            NSLog(@"lowercaseString is: %@", [object lowercaseString]);
        } else {
            NSLog(@"Répond a lowercaseString: NON");
        }
        
        NSLog(@"==============================");
    }
    
    NSLog(@"------------------------------------------\n\n");
}


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //Procédures a lancer
    displayPathInfo();
    displayProcessInfo();
    displayBookmarkInfo();
    displayIntrospection();
    
    [pool drain];
    return 0;
}
