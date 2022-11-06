node {  
    def app
    stage('Cloning Git') {
        /* Let's make sure we have the repository cloned to our workspace */
       checkout scm
    }  
    stage('SAST'){
        sh 'echo sast'
	//build 'SECURITY-SAST-SNYK'
    }

    
    stage('Build-and-Tag') {
    	sh 'echo build-and-tag'
	/* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("fabz26/test-snake")
    }
    stage('Post-to-dockerhub') {
     sh "echo post-to-dockerhub"
     withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
            app.push("latest")
        			}
         }
    stage('SECURITY-IMAGE-SCANNER'){
        sh "echo security-image-scanner"
	//build 'SECURITY-IMAGE-SCANNER-AQUAMICROSCANNER'
    }
  
    
    stage('Pull-image-server') {
    	 sh "echo pull-image"
         sh "docker-compose down"
         sh "docker-compose up -d"	
      }
    
    stage('DAST')
        {
	sh 'echo DAST'
        // build 'SECURITY-DAST-OWASP_ZAP'
        }
 
}
